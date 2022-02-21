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
# Achieve Goal Pose with the Object
class my_allegro:
	def __init__(self):
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
		#self.q1_ik = [0.0467,-0.167,0.815,0.8046]
		#self.q2_ik = [0.0396,-0.157,0.799,0.798]
		#self.q3_ik = [-0.045,-0.058,0.894,0.786]
		#self.q4_ik = [0.845,-0.440,0.301,0.7754]
		#self.pose1 = self.kdl_kin1.forward(self.q1_ik)
		#self.pose2 = self.kdl_kin2.forward(self.q2_ik)
		#self.pose3 = self.kdl_kin3.forward(self.q3_ik)
		#self.pose4 = self.kdl_kin4.forward(self.q4_ik)	
		#self.cur = [0,0,0,0,
		#									0,0,0,0,
		#									0,0,0,0,
		#									0,0,0,0]
		rospy.init_node('allegro_work')
		self.pub = rospy.Publisher('/allegroHand_0/joint_cmd', JointState, queue_size = 100)
		self.main_count = 0	
		self.rem = np.array([0.0,0.0,0.0])

	def jacob_control_main(self,err1,err2,err3,err4):
		self.pose1 = self.kdl_kin1.forward(self.q1_act)
		self.pose2 = self.kdl_kin2.forward(self.q2_act)
		self.pose3 = self.kdl_kin3.forward(self.q3_act)
		self.pose4 = self.kdl_kin4.forward(self.q4_act)	
		kdl_kin1 = KDLKinematics(self.robot,'palm_link', 'link_3.0_tip')
		kdl_kin2 = KDLKinematics(self.robot,'palm_link', 'link_7.0_tip')
		kdl_kin3 = KDLKinematics(self.robot,'palm_link', 'link_11.0_tip')
		kdl_kin4 = KDLKinematics(self.robot,'palm_link', 'link_15.0_tip')

#		self.q1_ik = kdl_kin1.inverse(self.pose1,self.q1_ik)
		xpose1 = [0,0,0]
		despose1 = [0,0,0]
		inpose1 = [0,0,0]
		xpose2 = [0,0,0]
		despose2 = [0,0,0]
		inpose2 = [0,0,0]
		xpose3 = [0,0,0]
		despose3 = [0,0,0]
		inpose3 = [0,0,0]
		xpose4 = [0,0,0]
		despose4 = [0,0,0]
		inpose4 = [0,0,0]
		for i in range(3):
			xpose1[i] = self.pose1[i,3]
			despose1[i] = self.pose1[i,3]
			inpose1[i] = self.pose1[i,3]
			xpose2[i] = self.pose2[i,3]
			despose2[i] = self.pose2[i,3]
			inpose2[i] = self.pose2[i,3]
			xpose3[i] = self.pose3[i,3]
			despose3[i] = self.pose3[i,3]
			inpose3[i] = self.pose3[i,3]
			xpose4[i] = self.pose4[i,3]
			despose4[i] = self.pose4[i,3]
			inpose4[i] = self.pose4[i,3]	
		#err1 = [0.01,0.02,-0.1]
		#err2 = [0.01,0.02,-0.1]
		#err3 = [0.01,0.02,-0.1]
		#err4 = [0.00,0.00,0.01]
		for i in range(3):
			despose1[i] += err1[i]
			despose2[i] += err2[i]
			despose3[i] += err3[i]
			despose4[i] += err4[i]
			tol = 1e-3
		#print("err1=",err1)
		#while np.linalg.norm(err1)>tol or np.linalg.norm(err2)>tol or np.linalg.norm(err3)>tol or np.linalg.norm(err4) >tol:
			#print("entered", np.linalg.norm(err1))
			flag1 = 1
		while flag1 == 1:
			flag1 = 0		
			self.pose1 = kdl_kin1.forward(self.q1_ik)
			self.pose2 = kdl_kin2.forward(self.q2_ik)
			self.pose3 = kdl_kin3.forward(self.q3_ik)
			self.pose4 = kdl_kin4.forward(self.q4_ik)
			for i in range(3):
				xpose1[i] = self.pose1[i,3]
				xpose2[i] = self.pose2[i,3]
				xpose3[i] = self.pose3[i,3]
				xpose4[i] = self.pose4[i,3]
			#if np.linalg.norm(err)!=0:
			#	err = err/np.linalg.norm(err)

			err1,delq1 = self.jacob_c(xpose1,despose1,kdl_kin1)
			err2,delq2 = self.jacob_c(xpose2,despose2,kdl_kin2)
			err3,delq3 = self.jacob_c(xpose3,despose3,kdl_kin3)
			err4,delq4 = self.jacob_c(xpose4,despose4,kdl_kin4)
			for i in range(4):
				self.q1_ik[i] += delq1[0,i]
				self.q2_ik[i] += delq2[0,i]
				self.q3_ik[i] += delq3[0,i]
				self.q4_ik[i] += delq4[0,i]
			#print(delq1)
			#print(self.q2_ik,1)
			

			self.curr_pose()
			curromeobj = self.twist[0:3]
			#print(curromeobj)
			self.q = [self.q1_ik[0],self.q1_ik[1],self.q1_ik[2],self.q1_ik[3],
								self.q2_ik[0], self.q2_ik[1], self.q2_ik[2], self.q2_ik[3],
								self.q3_ik[0], self.q3_ik[1], self.q3_ik[2], self.q3_ik[3],
								self.q4_ik[0], self.q4_ik[1], self.q4_ik[2], self.q4_ik[3]]
			#print(self.q)
			self.publish_states()
			#print("exit", np.linalg.norm(err1))			
	def jacob_c(self,xpose,despose,kdl_kin1):
			err = np.subtract(despose,xpose)*1
			erro = np.subtract(despose,xpose)
			J = kdl_kin1.jacobian(self.q1_ik)
			Jnew = J[0:3,:]
			delq = np.matmul(np.linalg.pinv(Jnew),err)
			return erro, delq
	def publish_states(self):
		Joint = JointState()
		Joint.name = ['joint_0.0','joint_1.0','joint_2.0','joint_3.0',
									'joint_4.0','joint_5.0','joint_6.0''joint_7.0',
									'joint_8.0','joint_9.0','joint_10.0','joint_11.0',
									'joint_12.0','joint_13.0','joint_14.0','joint_15.0', ]
		Joint.position = [0,0,0,0,
											0,0,0,0,
											0,0,0,0,
											0,0,0,0]
		for i in range(16):
			Joint.position[i] = self.q[i]

		self.pub.publish(Joint)
		

	def subs(self,data):

		self.cur = data.position



	def getcrossmat(self,vec):
		mat = np.array([[0, -vec[2],vec[1]],[vec[2],0,-vec[0]],[-vec[1],vec[0],0]])
		return mat

	def kin(self,delomeobj):
		self.curr_pose()
		if self.main_count == 1:
			self.rem = self.twist[0:3]
		#desomeobj = np.array([0.1,0,0])
		#curromeobj = np.array([0.1,0.0,0])
		self.twist[0:3] = self.twist[0:3]-self.rem
		curromeobj = self.twist[0:3]
		print(curromeobj)
		#delomeobj = np.array([0.3,0,0])
		desomeobj = delomeobj
		rate = rospy.Rate(10)
		for i in range(10):
			self.qdes = np.array([-0.085, 0.87, 0.5045, 1.3555,
								0.084, 0.85, 0.50, 1.10,
								0.1072, 0.06614, -0.0136, 0.0462,
								1.30, 0.43, 0.22, 1.21])

			rate.sleep()
		 	self.publish_states()
		#while not rospy.is_shutdown():
			count=0
			delomeobjcheck = delomeobj
			count = 1	
		print(np.linalg.norm(delomeobj))
		while count<3 and np.linalg.norm(delomeobjcheck)<0.5:
			count+=1
			#curromeobj = curromeobj+(-1)**count*np.array([0.2,0,0])	
			#rospy.Subscriber('/allegroHand_0/joint_states', JointState, self.subs)
			data = rospy.wait_for_message('/allegroHand_0/joint_states', JointState)		
			self.cur = data.position	
			q1 = [self.cur[0],self.cur[1],self.cur[2],self.cur[3]]
			q2 = [self.cur[4],self.cur[5],self.cur[6],self.cur[7]]
			q3 = [self.cur[8],self.cur[9],self.cur[10],self.cur[11]]
			q4 = [self.cur[12],self.cur[13],self.cur[14],self.cur[15]]
			T1 = self.kdl_kin1.forward(q1)
			T2 = self.kdl_kin2.forward(q2)
			T3 = self.kdl_kin3.forward(q3)
			T4 = self.kdl_kin4.forward(q4)
			p1 = np.array([T1[0,3],T1[1,3],T1[2,3]])
			p2 = np.array([T2[0,3],T2[1,3],T2[2,3]])
			p3 = np.array([T3[0,3],T3[1,3],T3[2,3]])
			p4 = np.array([T4[0,3],T4[1,3],T4[2,3]])
			rf1 = np.array([p1[0]-p4[0],p1[1]-p4[1],p1[2]-p4[2]])
			rf2 = np.array([p2[0]-p4[0],p2[1]-p4[1],p2[2]-p4[2]])
			rf3 = np.array([p3[0]-p4[0],p3[1]-p4[1],p3[2]-p4[2]])
			q1_req = self.q[0:4]
			q2_req = self.q[4:8]
			q3_req = self.q[8:12]
			q4_req = self.q[12:16]
			self.curr_pose()
			curromeobj = self.twist[0:3]
			
			rf1tilde = self.getcrossmat(rf1)
			rf2tilde = self.getcrossmat(rf2)
			rf3tilde = self.getcrossmat(rf3)
			Jacob = np.concatenate((rf1tilde,rf2tilde,rf3tilde),axis=0)
			delomeobj = (desomeobj-curromeobj)
			delomeobjcheck = (desomeobj-curromeobj)
			self.q1_ik = q1_req
			self.q2_ik = q2_req
			self.q3_ik = q3_req
			self.q4_ik = q4_req
			self.q1_act = q1_req
			self.q2_act = q2_req
			self.q3_act = q3_req
			self.q4_act = q4_req
			delomeobj[2]=0
			delomeobj[1]=0
			err = np.matmul(Jacob,delomeobj)*0.4
			#print("Current",curromeobj)
			print("delta", delomeobj)
			
			err1 = err[0:3]
			err2 = err[3:6]
			err3 = np.array([0,0,0])
			err4 = 0*err[6:9]

			self.jacob_control_main(err1,err2,err3,err4)
			self.publish_states()
		return delomeobjcheck

	def reachgoalpose(self):
		data = rospy.wait_for_message('/allegroHand_0/joint_states', JointState)		
		self.cur = data.position
		#rospy.Subscriber('/allegroHand_0/joint_states', JointState, self.subs)
		q1 = [self.cur[0],self.cur[1],self.cur[2],self.cur[3]]
		q2 = [self.cur[4],self.cur[5],self.cur[6],self.cur[7]]
		q3 = [self.cur[8],self.cur[9],self.cur[10],self.cur[11]]
		q4 = [self.cur[12],self.cur[13],self.cur[14],self.cur[15]]
		self.qdes = np.array([-0.085, 0.87, 0.5045, 1.3555,
								0.084, 0.85, 0.50, 1.10,
								0.1072, 0.06614, -0.0136, 0.0462,
								1.30, 0.43, 0.22, 1.21])

		Joint = JointState()
		Joint.name = ['joint_0.0','joint_1.0','joint_2.0','joint_3.0',
									'joint_4.0','joint_5.0','joint_6.0''joint_7.0',
									'joint_8.0','joint_9.0','joint_10.0','joint_11.0',
									'joint_12.0','joint_13.0','joint_14.0','joint_15.0', ]
		Joint.position = [0,0,0,0,
											0,0,0,0,
											0,0,0,0,
											0,0,0,0]

		
		q1 = [self.cur[0],self.cur[1],self.cur[2],self.cur[3]]
		q2 = [self.cur[4],self.cur[5],self.cur[6],self.cur[7]]
		q3 = [self.cur[8],self.cur[9],self.cur[10],self.cur[11]]
		q4 = [self.cur[12],self.cur[13],self.cur[14],self.cur[15]]
		self.q = np.array([-0.039,-0.2187,0.8021,0.8193,0.0393,-0.199,0.834,0.8610,0.0526,-0.061,0.90027,0.8008,0.8226,0.379,0.104,0.767])
		req = 100
		count=1
		tol = 0.0001
		while np.linalg.norm(req)>tol:
			#print(np.linalg.norm(req))
			data = rospy.wait_for_message('/allegroHand_0/joint_states', JointState)		
			self.cur = data.position
			self.qact = self.cur
			self.q = self.q + (self.qdes-self.q)*0.1
			req = self.q-self.qdes
			for i in range(16):
				Joint.position[i] = self.q[i]

			self.pub.publish(Joint)

		self.publish_states()
		time.sleep(10)

	def calib_pose(self):
		twisttake = rospy.wait_for_message('publ',Floats).data


		self.twistcalib = np.array([twisttake[0],twisttake[1],twisttake[2],twisttake[3],twisttake[4],twisttake[5]])
		
	def curr_pose(self):
		twisttake = rospy.wait_for_message('publ',Floats).data

		self.twist = np.array([twisttake[0],twisttake[1], twisttake[2], twisttake[3], twisttake[4], twisttake[5]])
		self.twist = self.twist-self.twistcalib

	def from_glove(self):
		delinitp= np.array([0.0,0.0,0.0])
		remain= np.array([0.0,0.0,0.0])
		count = 0
		while True:
			data1 = rospy.wait_for_message('/mx', Floats)
			data2 = rospy.wait_for_message('/my', Floats)
			data3 = rospy.wait_for_message('/mz', Floats)
			delinit = np.array([data1.data[0],0*data2.data[0],0*data3.data[0]])
			delinitp = delinit
			count = count+1
			if count<10:
				print(0)
			else:
				self.main_count=self.main_count+1
				remain=self.kin(delinit)
				print(delinit)
			
time.sleep(1)
obj = my_allegro()
#obj.jacob_control_main()
#obj.set_point()	
obj.reachgoalpose()
raw_input("Press Enter to continue...")
obj.calib_pose()
raw_input("Press Enter to continue...")
obj.from_glove()	
