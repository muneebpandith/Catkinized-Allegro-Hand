#!/usr/bin/env python
import rospy
import csv
from rospy_tutorials.msg import Floats
from sensor_msgs.msg import JointState


def newTf(data):


	data2 = rospy.wait_for_message("/allegroHand_0/joint_states", JointState)
	arr = []
	for i in range(16):
		arr = arr+[data2.position[i]]
	
	for i in range(16):
		arr = arr+[data2.effort[i]]

	arr = arr + [data2.header.stamp.secs]
	arr = arr+[data2.header.stamp.nsecs]
#	arr = [data.data[0],data.data[1],data.data[2],data.data[3],data.data[4],data.data[5],data2.header.stamp.secs,data2.header.stamp.nsecs]
	print("writing")
	with open('js_allegro_paper.csv', 'a') as f:
		writer = csv.writer(f)
		writer.writerow(arr)
def subscriber():
	rospy.init_node('listener', anonymous=True)
	rospy.Subscriber("/publ", Floats, newTf)

	rospy.spin()

open('js_allegro_paper.csv', 'w') 
subscriber()
