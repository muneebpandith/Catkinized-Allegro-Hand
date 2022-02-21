import numpy
import numpy as np
import matplotlib.pyplot as plt
from pandas import read_csv
import math
import keras
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics import mean_squared_error
from tensorflow.compat.v1.keras.backend import set_session
import tensorflow as tf
import time
from keras.layers.advanced_activations import LeakyReLU
from keras import backend as K
import pandas
physical_devices = tf.config.list_physical_devices('GPU')
tf.config.experimental.set_memory_growth(physical_devices[0], enable=True)

np.set_printoptions(threshold=np.inf)
# convert an array of values into a dataset matrix
def create_dataset(dataset, look_back=1, fut = 20):
	dataX, dataY = [], []
	for i in range(fut,len(dataset)-look_back-1):
		a = dataset[i:(i+look_back-fut)]
		dataX.append(a)
		dataY.append(dataset[i + look_back])
	return numpy.array(dataX), numpy.array(dataY)
# fix random seed for reproducibility
numpy.random.seed(7)
# load the dataset
dataframe1 = read_csv('new.csv', usecols=[1], engine='python')
dataframe2 = read_csv('new2.csv', usecols=[1], engine='python')
dataframe3 = read_csv('new3.csv', usecols=[1], engine='python')
dataframe = dataframe1.append(dataframe2)

#dataframe4 = read_csv('new4_tr.csv', usecols=[1] 	, engine = 'python')
dataframe = dataframe.append(dataframe3)
#dataframe = dataframe.append(dataframe4)
dataset = dataframe.values[:,0]
dataset = dataset.astype('float32')
# normalize the dataset
#scaler = MinMaxScaler(feature_range=(-1, 1))
#dataset = scaler.fit_transform(dataset)
print(np.min(dataset))

# split into train and test sets
train_size = int(len(dataset) * 0.67)
test_size = len(dataset) - train_size
train, test = dataset[0:train_size], dataset[train_size:len(dataset)]
# reshape into X=t and Y=t+1
look_back = 50
fut = 10
trainX, trainY = create_dataset(train, look_back)
testX, testY = create_dataset(test, look_back)
# reshape input to be [samples, time steps, features]
trainX = numpy.reshape(trainX, (trainX.shape[0], 1, trainX.shape[1]))
testX = numpy.reshape(testX, (testX.shape[0], 1, testX.shape[1]))
# create and fit the LSTM network
model = Sequential()
model.add(LSTM(4, input_shape=(1, look_back-fut)))
model.add(Dense(10))
model.add(Dense(10, activation='relu'))
model.add(Dense(1))
opt = keras.optimizers.Adam(learning_rate=0.001)
model.compile(loss='mean_squared_error', optimizer=opt)
ep = 200

history = model.fit(trainX, trainY, epochs=ep, batch_size=20, validation_data = (testX,testY))
# make predictions
trainPredict = model.predict(trainX)
testPredict = model.predict(testX)
# invert predictions

#trainPredict = scaler.inverse_transform(trainPredict)

#trainY = scaler.inverse_transform([trainY])
#testPredict = scaler.inverse_transform(testPredict)
#testY = scaler.inverse_transform([testY])
# calculate root mean squared error
trainScore = math.sqrt(mean_squared_error(trainY, trainPredict))
print('Train Score: %.2f RMSE' % (trainScore))
testScore = math.sqrt(mean_squared_error(testY, testPredict))
print('Test Score: %.2f RMSE' % (testScore))
# shift train predictions for plotting
trainPredictPlot = numpy.empty_like(dataset)
trainPredictPlot[:] = numpy.nan
trainPredictPlot[look_back:len(trainPredict)+look_back] = trainPredict[:,0]
# shift test predictions for plotting
testPredictPlot = numpy.empty_like(dataset)
testPredictPlot[:] = numpy.nan
testPredictPlot[int(len(dataset)*0.67)+fut+look_back:-1] = testPredict[:,0]
model.save('RNN_main_pap.model')
# plot baseline and predictions
plt.plot((dataset))
plt.plot(trainPredictPlot)
plt.plot(testPredictPlot)
plt.show()
arrA = np.asarray(dataset)
arrB = np.asarray(trainPredictPlot)
arrC = np.asarray(testPredictPlot)
output = np.column_stack((arrA.flatten(),arrB.flatten(),arrC.flatten()))
np.savetxt('pap1.csv',output,delimiter=',')
loss_train = history.history['loss']
loss_val = history.history['val_loss']
epochs = range(1,ep+1)
plt.plot(epochs, loss_train, 'g', label='Training loss')
plt.plot(epochs, loss_val, 'b', label='validation loss')
plt.title('Training and Validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()
arrA = np.asarray(epochs)
arrB = np.asarray(loss_train)
arrC = np.asarray(loss_val)
output = np.column_stack((arrA.flatten(),arrB.flatten(),arrC.flatten()))
np.savetxt('pap2.csv',output,delimiter=',')

