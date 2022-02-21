#!/usr/bin/env python
import rospy
import csv
from fiducial_msgs.msg import FiducialTransform, FiducialTransformArray
from sensor_msgs.msg import JointState

def newdata(data):
	position = data.position
	torque = data.effort

	arr = []
	for i in range(11):
		arr.append(position[i])
	arr.append(data.header.stamp.secs)
	arr.append(data.header.stamp.nsecs)
	arr.append(data.header.seq)

	with open('glove_bottle.csv', 'a') as f:
		writer = csv.writer(f)
		writer.writerow(arr)
def subscriber():
	f1 = open('glove_bottle.csv','w+')
	f1.close()
	rospy.init_node('listener', anonymous=True)
	rospy.Subscriber('/glove_out', JointState, newdata)

	rospy.spin()

subscriber()
