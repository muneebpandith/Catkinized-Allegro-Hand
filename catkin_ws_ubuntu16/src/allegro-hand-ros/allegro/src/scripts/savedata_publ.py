#!/usr/bin/env python
import rospy
import csv
from rospy_tutorials.msg import Floats
from sensor_msgs.msg import JointState


def newTf(data):


	data2 = rospy.wait_for_message("/allegroHand_0/joint_states", JointState)
	arr = [data.data[0],data.data[1],data.data[2],data.data[3],data.data[4],data.data[5],data2.header.stamp.secs,data2.header.stamp.nsecs]
	print("writing")
	with open('data_allegro_paper.csv', 'a') as f:
		writer = csv.writer(f)
		writer.writerow(arr)
def subscriber():
	rospy.init_node('listener', anonymous=True)
	rospy.Subscriber("/publ", Floats, newTf)

	rospy.spin()

open('data_allegro_paper.csv', 'w') 
subscriber()
