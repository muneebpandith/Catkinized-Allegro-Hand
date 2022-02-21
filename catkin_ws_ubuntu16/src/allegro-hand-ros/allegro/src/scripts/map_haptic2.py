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




class maphaptic:
	def __init__(self):

		self.const1 = 145.0/57.3
		self.const2 = 15/57.3
	
		rospy.init_node('mapper', anonymous=True)
		self.pub = rospy.Publisher('/allegroHand_0/joint_cmd', JointState, queue_size=10)
		self.setpoint_pub = rospy.Publisher('/glove_setpoint', JointState, queue_size=10)
		print("start")
		self.joint_set = []
		urdf_file = file('/home/rajesh/work/catkin_ws/src/allegro-hand-ros/allegro_hand_description/allegro_hand_description_right.urdf', 'r')
		self.robot = Robot.from_xml_string(urdf_file.read())
		urdf_file.close()
		self.tree = kdl_tree_from_urdf_model(self.robot)
		self.kdl_kin1 = KDLKinematics(self.robot,'palm_link', 'link_3.0_tip')
		self.kdl_kin2 = KDLKinematics(self.robot,'palm_link', 'link_7.0_tip')
		self.kdl_kin3 = KDLKinematics(self.robot,'palm_link', 'link_11.0_tip')
		self.kdl_kin4 = KDLKinematics(self.robot,'palm_link', 'link_15.0_tip')

	def basic_map(self):

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
			self.pub.publish(Joint_out)

	def not_basic_map(self):
		while True:
			data1 = rospy.wait_for_message('/allegroHand_0/joint_states', JointState)		
			data2 = rospy.wait_for_message('/glove_out', JointState)
			#flagval = rospy.wait_for_message('/is_grasped',bool)		
			cur1 = list(data1.position)
			cur2 = list(data2.position)
			Joint_out = JointState()
			Joint_out.name = ['joint_0.0','joint_1.0','joint_2.0','joint_3.0',
											'joint_4.0','joint_5.0','joint_6.0''joint_7.0',
											'joint_8.0','joint_9.0','joint_10.0','joint_11.0',
											'joint_12.0','joint_13.0','joint_14.0','joint_15.0', ]

			Glove_out = JointState()
			Glove_out.name = ['g1','g2','g3','g4','gt']
			const = self.const			

			cur1[1] = data2.position[4]*const
			cur1[5] = data2.position[6]*const
			cur1[9] = data2.position[8]*const
			Joint_out.position = cur1
			Glove_out.position=[0,0,0,0,0]
			Glove_out.position[0] = cur1[1]/const
			Glove_out.position[1] = cur1[5]/const
			Glove_out.position[2] = cur1[9]/const
			Glove_out.position[3] = cur1[9]/const
			Glove_out.position[4] = cur1[13]/const
			self.pub.publish(Joint_out)
			self.setpoint_pub.publish(Glove_out)
			
	

	def new_one_sided(self):
		# Estimating the change in the virtual object pose 
		for i in range(10):
			data1 = rospy.wait_for_message('/allegroHand_0/joint_states', JointState)		
			data2 = rospy.wait_for_message('/glove_out', JointState)
			#flagval = rospy.wait_for_message('/is_grasped',bool)		
			cur1save = list(data1.position)
			cur2save = list(data2.position)
		print("start")
		const1 = self.const1
		const2 = self.const2
		objtwistprev = np.array([0.0,0.0,0.0])
		while True:
			data1 = rospy.wait_for_message('/allegroHand_0/joint_states', JointState)		
			data2 = rospy.wait_for_message('/glove_out', JointState)
			#flagval = rospy.wait_for_message('/is_grasped',bool)		
			cur1 = list(data1.position)
			cur2 = list(data2.position)
			self.q1_act = cur1[0:4]
			self.q2_act = cur1[4:8]
			self.q3_act = cur1[8:12]
			self.q4_act = cur1[12:16]
			
			self.pose1 = self.kdl_kin1.forward(self.q1_act)
			self.pose2 = self.kdl_kin2.forward(self.q2_act)
			self.pose3 = self.kdl_kin3.forward(self.q3_act)
			self.pose4 = self.kdl_kin4.forward(self.q4_act)	
			
			xpose1 = np.array([0.0,0.0,0.0])
			xpose2 = np.array([0.0,0.0,0.0])
			xpose3 = np.array([0.0,0.0,0.0])
			xpose4 = np.array([0.0,0.0,0.0])
			bo1 = [0,0.0435,-0.001542]
			bo2 = [0,0,0.0007]
			bo3 = [0,-0.0435,-0.001542]
			bo4 = [-0.0182,0.01933,-0.04598]			
			for i in range(3):
				xpose1[i] = self.pose1[i,3]-bo1[i]
				xpose2[i] = self.pose2[i,3]-bo2[i]
				xpose3[i] = self.pose3[i,3]-bo3[i]
				xpose4[i] = self.pose4[i,3]-bo4[i]
		
			om1t = (cur2[3]-cur2save[3])*const2
			om2t = (cur2[5]-cur2save[5])*const2
			om3t = (cur2[7]-cur2save[7])*const2
			om4t = 0

			om1g = (cur2[4]-cur2save[4])*const1
			om2g = (cur2[6]-cur2save[6])*const1
			om3g = (cur2[8]-cur2save[8])*const1
			om4g = 0
			vel_fing1 = np.cross(np.array([0,0,om1t]),xpose1)
			vel_fing2 = np.cross(np.array([0,0,om2t]),xpose2)
			vel_fing3 = np.cross(np.array([0,0,om3t]),xpose3)
			vel_fing4 = np.cross(np.array([0,0,om4t]),xpose4)
			delr1t = xpose1-xpose4
			delr2t = xpose2-xpose4
			delr3t = xpose3-xpose4
			r1mat = self.getrmat(delr1t)
			r2mat = self.getrmat(delr2t)
			r3mat = self.getrmat(delr3t)
			Jacob = np.concatenate((r1mat,r2mat),axis=0)
			netmat = np.array([0.0,0.0,0.0,0.0,0.0,0.0])
			for i in range(3):
				netmat[i] = vel_fing1[i]
				netmat[i+3] = vel_fing2[i]
				#netmat[i+6] = vel_fing3[i]
			objtwist = np.matmul(np.linalg.pinv(Jacob),netmat)
			objtwistprev = objtwist+objtwistprev
			print(objtwistprev)
			cur2save=cur2
	
	def getrmat(self,r):	
		mat = np.array([[0.0,0.0,0.0,0.0,0.0,0.0],[0.0,0.0,0.0,0.0,0.0,0.0],[0.0,0.0,0.0,0.0,0.0,0.0]])
		mat = np.array([[0.0,0.0,0.0],[0.0,0.0,0.0],[0.0,0.0,0.0]])
		#mat[0,4] = -r[2]
		#mat[0,3] = 0
		#mat[0,5] = r[1]
		#mat[1,3] = r[2]
		#mat[1,4] = 0
		#mat[1,5] = -r[0]
		#mat[2,3] = -r[1]
		#mat[2,4] = r[0]
		#mat[2,5] = 0	
		#mat[0,0] = 1
		#mat[1,1] = 1
		#mat[2,2] = 1
		mat[0,0] = 0
		mat[0,1] = -r[2]
		mat[0,2] = r[1]
		mat[1,0] = r[2]
		mat[1,1] = 0
		mat[1,2] = -r[0]
		mat[2,0] = -r[1]
		mat[2,1] = r[0]
		mat[2,2] = 0
		return mat	 								
obj = maphaptic()

obj.new_one_sided()

