#!/usr/bin/env python
import rospy
import csv
from fiducial_msgs.msg import FiducialTransform, FiducialTransformArray
from sensor_msgs.msg import JointState

def newdata(data):
	position = data.position
	torque = data.effort

	arr = []
	for i in range(16):
		arr.append(position[i])
	for i in range(16):
		arr.append(torque[i])
	arr.append(data.header.stamp.secs)
	arr.append(data.header.stamp.nsecs)
	arr.append(data.header.seq)

	with open('snr1.csv', 'a') as f:
		writer = csv.writer(f)
		writer.writerow(arr)
		print(1)
def subscriber():
	f1 = open('snr1.csv','w+')
	f1.close()
	rospy.init_node('listener', anonymous=True)
	rospy.Subscriber('/allegroHand_0/joint_states', JointState, newdata)

	rospy.spin()

subscriber()
