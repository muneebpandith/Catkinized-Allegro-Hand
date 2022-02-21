#!/usr/bin/env python

from urdf_parser_py.urdf import Robot
import numpy as np
import rospy
from sensor_msgs.msg import JointState
import time
from scipy import stats 


def trial():
	rospy.init_node("noder")
	j = []
	count = 0
        while not rospy.is_shutdown():
		data = rospy.wait_for_message('/allegroHand_0/joint_states', JointState)		
		cur = data.position
		j.append(cur[0])
		count = count+1
		if (count>5):

			if ((count%10) == 0):
				print(signaltonoise(j))
				j=[]			
	rospy.spin()

trial()
