#!/usr/bin/env python
import rospy
import csv
from fiducial_msgs.msg import FiducialTransform, FiducialTransformArray
from sensor_msgs.msg import JointState
from rospy_tutorials.msg import Floats
import numpy
import matplotlib.pyplot as plt
import math
import numpy as np
import scipy
from sklearn.metrics import mean_squared_error
from tensorflow.compat.v1.keras.backend import set_session
import tensorflow as tf
import numpy as np  
import matplotlib.pyplot as plt  
physical_devices = tf.config.list_physical_devices('GPU')
tf.config.experimental.set_memory_growth(physical_devices[0], enable=True)

global count
count = 0

def newdata(data):
	global count
	position = data.data
	arr = []
	arr.append(count)
	arr.append(data.data[0])
	count = count+1
	if count>30
		X = arr
		X = numpy.reshape(X, (X.shape[0], 1, X.shape[1]))
		
		model = tf.keras.models.load_model("RNN_main_pap.model")
		prediction = model.predict(X)
		pub = rospy.Publisher('/mx_n', Floats, queue_size = 10)
		pub.publish(prediction)		
		
def subscriber():
	rospy.init_node('pubpred', anonymous=True)
	rospy.Subscriber('/mx', Floats, newdata)
	
	rospy.spin()

subscriber()
