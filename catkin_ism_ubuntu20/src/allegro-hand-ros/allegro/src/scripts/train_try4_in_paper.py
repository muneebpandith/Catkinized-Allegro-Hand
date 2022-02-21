import numpy
import matplotlib.pyplot as plt
from pandas import read_csv
import math
import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics import mean_squared_error
from tensorflow.compat.v1.keras.backend import set_session
import tensorflow as tf
physical_devices = tf.config.list_physical_devices('GPU')
tf.config.experimental.set_memory_growth(physical_devices[0], enable=True)


# convert an array of values into a dataset matrix
def create_dataset(dataset, look_back=1, fut = 10):
	dataX, dataY = [], []
	for i in range(fut,len(dataset)-look_back-1):
		a = dataset[i:(i+look_back-fut), 0]
		dataX.append(a)
		dataY.append(dataset[i + look_back, 0])
	return numpy.array(dataX), numpy.array(dataY)
# fix random seed for reproducibility
numpy.random.seed(7)
# load the dataset
dataframe1 = read_csv('new.csv', usecols=[1], engine='python')
dataframe2 = read_csv('new2.csv', usecols=[1], engine='python')
dataframe3 = read_csv('new3.csv', usecols=[1], engine='python')
dataframe = dataframe1.append(dataframe2)
dataframe4 = read_csv('new4.csv', usecols=[1], engine='python')
#dataframe = dataframe.append(dataframe4)
dataframe = dataframe.append(dataframe3)
dataset = dataframe.values
print(dataframe4.values)
dataset = dataset.astype('float32')
# normalize the dataset
scaler = MinMaxScaler(feature_range=(0, 1))
dataset = scaler.fit_transform(dataset)
# split into train and test sets
train_size = int(len(dataset) * 0.67)
test_size = len(dataset) - train_size
train, test = dataset[0:train_size], dataset[train_size:len(dataset)]
# reshape into X=t and Y=t+1
look_back = 30
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
model.compile(loss='mean_squared_error', optimizer='adam')
ep = 1000
history = model.fit(trainX, trainY, epochs=ep, batch_size=100, validation_data = (testX,testY))
# make predictions
trainPredict = model.predict(trainX)
testPredict = model.predict(testX)
# invert predictions
print(trainPredict)
trainPredict = scaler.inverse_transform(trainPredict)

trainY = scaler.inverse_transform([trainY])
testPredict = scaler.inverse_transform(testPredict)
testY = scaler.inverse_transform([testY])
# calculate root mean squared error
trainScore = math.sqrt(mean_squared_error(trainY[0], trainPredict[:,0]))
print('Train Score: %.2f RMSE' % (trainScore))
testScore = math.sqrt(mean_squared_error(testY[0], testPredict[:,0]))
print('Test Score: %.2f RMSE' % (testScore))
# shift train predictions for plotting
trainPredictPlot = numpy.empty_like(dataset)
trainPredictPlot[:, :] = numpy.nan
trainPredictPlot[look_back:len(trainPredict)+look_back, :] = trainPredict
# shift test predictions for plotting
testPredictPlot = numpy.empty_like(dataset)
testPredictPlot[:, :] = numpy.nan
testPredictPlot[int(len(dataset)*0.67)+fut+look_back:-1] = testPredict
model.save('RNN_main2.model')
# plot baseline and predictions
plt.plot(scaler.inverse_transform(dataset))
plt.plot(trainPredictPlot)
plt.plot(testPredictPlot)
plt.show()
arrA = np.asarray(scaler.inverse_transform(dataset))
arrB = np.asarray(trainPredictPlot)
arrC = np.asarray(testPredictPlot)
output = np.column_stack((arrA.flatten(),arrB.flatten(),arrC.flatten()))
np.savetxt('pap.csv',output,delimiter=',')
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

