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
from allegro_work_class import my_allegro
import PyKDL as kdl
class get_forces:
	def __init__(self):
		print("started")
		rospy.init_node("forces")
		self.hand = my_allegro()
		self.pub = rospy.Publisher('/force', Floats, queue_size=100)
		
	def get_effortval(self):
		count=0
		comp1 = np.array([0,0,0,0],dtype=np.float64)
		comp2 = np.array([0,0,0,0],dtype=np.float64)
		comp3 = np.array([0,0,0,0],dtype=np.float64)
		comp4 = np.array([0,0,0,0],dtype=np.float64)
		while(not rospy.is_shutdown()):
			data = rospy.wait_for_message('/allegroHand_0/joint_states', JointState)
			grav_comp = rospy.wait_for_message('/allegroHand_0/grav_compensation', JointState)		

			self.ja = data.position
			self.effort = data.effort
			self.comp = grav_comp.effort
			self.q1_ik = np.array([self.ja[0], self.ja[1], self.ja[2], self.ja[3]])
			self.q2_ik = np.array([self.ja[4], self.ja[5], self.ja[6], self.ja[7]])
			self.q3_ik = np.array([self.ja[8], self.ja[9], self.ja[10], self.ja[11]])
			self.q4_ik = np.array([self.ja[12], self.ja[13], self.ja[14], self.ja[15]])
			#comp1=self.get_grav_compenstorque(self.hand.kdl_ch1,self.q1_ik)	
			#comp2=self.get_grav_compenstorque(self.hand.kdl_ch2,self.q2_ik)	
			#comp3=self.get_grav_compenstorque(self.hand.kdl_ch3,self.q3_ik)	
			#comp4=self.get_grav_compenstorque(self.hand.kdl_ch4,self.q4_ik)
	

			for i in range(4):
				comp1[i] = self.comp[i]
				comp2[i] = self.comp[i+4]
				comp3[i] = self.comp[i+8]
				comp4[i] = self.comp[i+12]
			fingi1 = np.array([self.effort[0],self.effort[1],self.effort[2],self.effort[3]])
			fingi2 = np.array([self.effort[4],self.effort[5],self.effort[6],self.effort[7]])
			fingi3 = np.array([self.effort[8],self.effort[9],self.effort[10],self.effort[11]])
			fingi4 = np.array([self.effort[12],self.effort[13],self.effort[14],self.effort[15]])
			fing1 =fingi1-comp1
			fing2 =fingi2-comp2
			fing3 =fingi3-comp3
			fing4 =fingi4-comp4
			f1 = self.get_netwrench(self.hand.kdl_kin1,self.q1_ik,fing1)
			f2 = self.get_netwrench(self.hand.kdl_kin2,self.q2_ik,fing2)
			f3 = self.get_netwrench(self.hand.kdl_kin3,self.q3_ik,fing3)
			f4 = self.get_netwrench(self.hand.kdl_kin4,self.q4_ik,fing4)
			self.pose1 = self.hand.kdl_kin1.forward(self.q1_ik)
			self.pose2 = self.hand.kdl_kin2.forward(self.q2_ik)
			self.pose3 = self.hand.kdl_kin3.forward(self.q3_ik)
			self.pose4 = self.hand.kdl_kin4.forward(self.q4_ik)
			xpose1 = np.array([0,0,0])
			xpose2 = np.array([0,0,0])
			xpose3 = np.array([0,0,0])
			xpose4 = np.array([0,0,0])
			R1 = np.identity(3)
			R2 = np.identity(3)
			R3 = np.identity(3)
			R4 = np.identity(3)
			#for i in range(3):
			#	for j in range(3):
			#		R1[i,j] = self.pose1[i,j]
			#		R2[i,j] = self.pose2[i,j]
			#		R3[i,j] = self.pose3[i,j]
			#		R4[i,j] = self.pose4[i,j]
			for i in range(3):
				xpose1[i] = self.pose1[i,3]
				xpose2[i] = self.pose2[i,3]
				xpose3[i] = self.pose3[i,3]
				xpose4[i] = self.pose4[i,3]
			netforce = np.matmul(R1,f1.T)+np.matmul(R2,f2.T)+np.matmul(R4,f4.T)
			#print("comp",comp3)
			#print("original:",fingi1)
			#print(comp1,fing1)
			print(fing1)


	def get_netwrench(self,kdl_kin1,q1,effortvec):
			J = kdl_kin1.jacobian(q1)
			Jnew = J[0:3,:]

			netval = np.matmul(np.linalg.pinv(J.T),effortvec)
			forceval = np.array([netval[0,0], netval[0,1], netval[0,2]])
			return forceval

	def get_grav_compenstorque(self,ch,q1):
		grav_vector = kdl.Vector(0, 0,9.81)
		dynamics = kdl.ChainDynParam(ch, grav_vector)
		jt1 = kdl.JntArray(4)

		jt1[0] = q1[0]
		jt1[1] = q1[1]
		jt1[2] = q1[2]
		jt1[3] = q1[3]
		anmat = kdl.JntArray(4)

		dynamics.JntToGravity(jt1, anmat)
		comp = np.array([anmat[0], anmat[1], anmat[2], anmat[3]])
		return comp
obj = get_forces()
obj.get_effortval()

			
