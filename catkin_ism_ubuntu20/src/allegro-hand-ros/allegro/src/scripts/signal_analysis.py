#!/usr/bin/env python

import numpy as np
import rospy
from sensor_msgs.msg import JointState
import time
import random

def trial():
	rospy.init_node("writer")
	pub = rospy.Publisher('/allegroHand_0/joint_cmd', JointState, queue_size=10)
	Joint = JointState()
	Joint.name = ['joint_0.0','joint_1.0','joint_2.0','joint_3.0',
									'joint_4.0','joint_5.0','joint_6.0''joint_7.0',
									'joint_8.0','joint_9.0','joint_10.0','joint_11.0',
									'joint_12.0','joint_13.0','joint_14.0','joint_15.0', ]
	Joint.position = [0,0,0,0,
											0,0,0,0,
											0,0,0,0,
											0,0,0,0]

	
	count = 0
	rate = rospy.Rate(5)
	while not(rospy.is_shutdown()):
		Joint.position = [random.uniform(-0.5,0.5), random.uniform(-0.2,1.6), random.uniform(-0.1,1.71), random.uniform(-0.1,1.6),
				random.uniform(-0.5,0.5), random.uniform(-0.2,1.6), random.uniform(-0.1,1.71), random.uniform(-0.1,1.6),
				random.uniform(-0.5,0.5), random.uniform(-0.2,1.6), random.uniform(-0.1,1.71), random.uniform(-0.1,1.6),
				random.uniform(0.26,1.4), random.uniform(-0.1,1.1), random.uniform(-0.1,1.6), random.uniform(-0.1,1.6)]
		pub.publish(Joint)
		rate.sleep()

trial()
