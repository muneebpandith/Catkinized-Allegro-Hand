#!/usr/bin/env python
# -*- coding: utf-8 -*-
from socket import *
import threading
import src
from sensor_msgs.msg import JointState
import rospy



def publisher():
	host_ip = "127.0.0.1"
	host_port = 55555
	sock = socket(AF_INET, SOCK_STREAM)
	sock.connect((host_ip, host_port))
	print("connected")
	pub = rospy.Publisher('glove_out', JointState, queue_size=10)
	frame_read_worker_i = src.frame_read_worker(sock)
	rate = rospy.Rate(10) # 10hz
	Joint = JointState()	
	Joint.name = ['thumb_rotate','thumb_split','thumb_bend',
		'index_split','index_bend',
		'middle_split','middle_bend',
		'ring_split','ring_bend',	
		'last_split','last_bend']
	Joint.position = [0,0,0,
			0,0,
			0,0,
			0,0,
			0,0]


	while not rospy.is_shutdown():

		try:
			valset=frame_read_worker_i.worker()
			flag=1
			if flag!=0:
				for i in range(11):
					Joint.position[i]=valset[i]
				pub.publish(Joint)

		except:
			print("Exception")

# connect to server
rospy.init_node('haptic_glove', anonymous=True)
publisher()


