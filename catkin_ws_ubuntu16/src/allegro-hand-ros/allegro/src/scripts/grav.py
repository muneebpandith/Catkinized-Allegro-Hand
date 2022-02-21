#!/usr/bin/env python

from urdf_parser_py.urdf import URDF
from pykdl_utils.kdl_parser import kdl_tree_from_urdf_model
from pykdl_utils.kdl_kinematics import KDLKinematics
from urdf_parser_py.urdf import Robot
import numpy as np
import rospy
from sensor_msgs.msg import JointState
import time



rospy.init_node("grav")
pub = rospy.Publisher('/allegroHand_0/joint_cmd', JointState, queue_size = 100)	
Joint = JointState()
Joint.name = ['joint_0.0','joint_1.0','joint_2.0','joint_3.0',
		'joint_4.0','joint_5.0','joint_6.0''joint_7.0',
		'joint_8.0','joint_9.0','joint_10.0','joint_11.0',
		'joint_12.0','joint_13.0','joint_14.0','joint_15.0', ]

Joint.position = [0,1,0,0,
		0,0,0,0,
		0,0,0,0,
		0,0,0,0]



r = rospy.Rate(100)
while(not rospy.is_shutdown()):
	print(Joint)
	pub.publish(Joint)
	r.sleep()
