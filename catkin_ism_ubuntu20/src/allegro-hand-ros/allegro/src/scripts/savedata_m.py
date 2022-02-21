#!/usr/bin/env python
import rospy
import csv
from fiducial_msgs.msg import FiducialTransform, FiducialTransformArray
from sensor_msgs.msg import JointState
from rospy_tutorials.msg import Floats

global count
count = 0

def newdata(data):
	global count
	position = data.data
	arr = []
	arr.append(count)
	arr.append(data.data[0])
	count = count+1
	with open('new5.csv', 'a') as f:
		writer = csv.writer(f)
		writer.writerow(arr)
		print(1)
def subscriber():
	f1 = open('mx.csv','w+')
	f1.close()
	rospy.init_node('listener', anonymous=True)
	rospy.Subscriber('/mx', Floats, newdata)

	rospy.spin()

subscriber()
