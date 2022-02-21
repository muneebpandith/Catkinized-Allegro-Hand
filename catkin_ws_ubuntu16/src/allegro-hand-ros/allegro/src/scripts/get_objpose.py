#!/usr/bin/env python

from urdf_parser_py.urdf import URDF
from pykdl_utils.kdl_parser import kdl_tree_from_urdf_model
from pykdl_utils.kdl_kinematics import KDLKinematics
from urdf_parser_py.urdf import Robot
import numpy as np
import rospy
from trial_calib import getcampose 
from fiducial_msgs.msg import FiducialTransform, FiducialTransformArray
from rospy.numpy_msg import numpy_msg
from rospy_tutorials.msg import Floats
import scipy
import time 
from scipy.spatial.transform import Rotation as R

class getobjpose:
	def __init__(self):
		print("object pose started")
	#	getcampose.__init__()
		self.obj = getcampose()
		self.Tcam = np.identity(4)
		rospy.init_node('Camposelistener',anonymous= True)
		self.twist = np.array([0,0,0,0,0,0])
		self.rot = np.array([[1,0,0],[0,1,0],[0,0,1]])
		self.axis = np.array([0,0,0])
	def newTfc(self,data):
		self.trc = data.transforms[0].transform.translation
		self.roc = data.transforms[0].transform.rotation
		self.camid = data.transforms[0].fiducial_id
		#print(self.roc)
		self.twistpub = rospy.Publisher('publ',Floats, queue_size=10)
	def newTf(self,data):

		#print(data.transforms[0].fiducial_id)
		try:
			if data.transforms[0].fiducial_id != self.camid:
				self.tr = data.transforms[0].transform.translation
				self.ro = data.transforms[0].transform.rotation
				a = self.ro.x
				b = self.ro.y
				c = self.ro.z
				d = self.ro.w
				x = self.tr.x
				y = self.tr.y
				z = self.tr.z

				self.cTo =  self.obj.getT(a,b,c,d,x,y,z)
				self.bTo = np.matmul(self.Tcam,self.cTo)
				rotationmat = self.bTo[0:3,0:3]
				self.rot = R.from_dcm(rotationmat)
				self.axis = self.rot.as_rotvec()



		except:
			print("caught")
		
	def camposeval(self):
		for i in range(20):
			data=rospy.wait_for_message("/fiducial_transforms", FiducialTransformArray)
			self.newTfc(data)			
			#rospy.Subscriber("/fiducial_transforms", FiducialTransformArray, self.newTfc)

			a = self.roc.x
			b = self.roc.y
			c = self.roc.z
			d = self.roc.w
			x = self.trc.x
			y = self.trc.y
			z = self.trc.z
			self.ro = self.roc
			self.tr = self.trc
		 	self.Tcam = self.obj.get_campose(a,b,c,d,x,y,z)
		print("end camera pose")

	def objposeval(self):
		while(1):

			data = rospy.wait_for_message("/fiducial_transforms", FiducialTransformArray)
			self.newTf(data)

			omx = self.axis[0]
			omy = self.axis[1]
			omz = self.axis[2]
			try:
				omx = self.axis[0]
				omy = self.axis[1]
				omz = self.axis[2]
				self.twist = np.array([omx,omy,omz,self.bTo[0,3],self.bTo[1,3],self.bTo[2,3]])

				self.pub_twist()
				
			except:
				print("none")

			#data=rospy.wait_for_message("/fiducial_transforms", FiducialTransformArray)
			#flag = self.newTf(data)
	


	def pub_twist(self):

		a= self.twist

		self.twistpub.publish(a)
		#print("publ",a)
		print(self.twist)
	# [tr.x,tr.y,tr.z,ro.x,ro.y,ro.z,ro.w,data.header.stamp.secs,data.header.stamp.nsecs, data.header.seq, data.image_seq]
	#4 for rot

obj = getobjpose()
obj.camposeval()

obj.objposeval()

