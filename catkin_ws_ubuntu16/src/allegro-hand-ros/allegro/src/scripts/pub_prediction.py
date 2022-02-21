#!/usr/bin/env python

import numpy
import matplotlib.pyplot as plt
from pandas import read_csv
import math
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
import numpy as np
import scipy
from sklearn.metrics import mean_squared_error
from tensorflow.compat.v1.keras.backend import set_session
import tensorflow as tf
import numpy as np  
import matplotlib.pyplot as plt  
from scipy import signal  
import math
from scipy.signal import find_peaks





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
dataframe4 = read_csv('new5.csv', usecols=[1], engine='python')
#dataframe = dataframe.append(dataframe4)
dataframe = dataframe4
dataset = dataframe.values

dataset = dataset.astype('float32')
# normalize the dataset

look_back = 30
fut = 10

X, Y = create_dataset(dataset, look_back)
print(X.shape)
# reshape input to be [samples, time steps, features]
X = numpy.reshape(X, (X.shape[0], 1, X.shape[1]))
# create and fit the LSTM network
model = tf.keras.models.load_model("RNN_main4.model")
prediction = model.predict(X)
# plot baseline and predictions
Yn = np.zeros(Y.size+10)
for i in range(Y.size):
	Yn[i+10] = Y[i] 
plt.plot(Yn)
plt.plot(prediction)

plt.show()
peakind = find_peaks(prediction.flatten(), width = 5)
print(peakind[0])
plt.plot(peakind[0],prediction[peakind[0]])
plt.plot(Yn)
plt.plot(prediction)
plt.show()




