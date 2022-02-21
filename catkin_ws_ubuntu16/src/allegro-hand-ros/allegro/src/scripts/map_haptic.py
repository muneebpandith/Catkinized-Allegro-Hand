#!/usr/bin/env python

from urdf_parser_py.urdf import URDF
from pykdl_utils.kdl_parser import kdl_tree_from_urdf_model
from pykdl_utils.kdl_kinematics import KDLKinematics
from urdf_parser_py.urdf import Robot
import numpy as np
import rospy
from sensor_msgs.msg import JointState
from rospy_tutorials.msg import Floats
import time


const = 145.0/57.3


rospy.init_node('mapper', anonymous=True)
pub = rospy.Publisher('/allegroHand_0/joint_cmd', JointState, queue_size=10)

while True:

	data1 = rospy.wait_for_message('/allegroHand_0/joint_states', JointState)		
	data2 = rospy.wait_for_message('/glove_out', JointState)		
	cur1 = list(data1.position)
	cur2 = list(data2.position)
	Joint_out = JointState()
	Joint_out.name = ['joint_0.0','joint_1.0','joint_2.0','joint_3.0',
									'joint_4.0','joint_5.0','joint_6.0''joint_7.0',
									'joint_8.0','joint_9.0','joint_10.0','joint_11.0',
									'joint_12.0','joint_13.0','joint_14.0','joint_15.0', ]

	print(cur2[1])
	cur1[1] = data2.position[4]*const
	cur1[5] = data2.position[6]*const
	cur1[9] = data2.position[8]*const
	Joint_out.position = cur1
	pub.publish(Joint_out)
	


