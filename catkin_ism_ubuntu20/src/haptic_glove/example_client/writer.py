#!/usr/bin/env python
# -*- coding: utf-8 -*-
from socket import *
import threading
import src
from sensor_msgs.msg import JointState
import rospy
from proto_util import ctrl_command_pb2 as command
import threading
import src


# connect to server


def set_test_impedance_control(t,i,m,r,p,stiff):
    new_impedance_control = command.ImpedanceControl()
    new_impedance_control.Thumb.Stiffness = stiff  # 0-1,stand for hardness of the force,0 stand for no force
    new_impedance_control.Thumb.SetPoint = t  # 0-1,stand for position of the force,sign stand for direction,positive number for inward,minus number for outward
    new_impedance_control.Index.Stiffness = stiff
    new_impedance_control.Index.SetPoint = i
    new_impedance_control.Middle.Stiffness = stiff
    new_impedance_control.Middle.SetPoint = m
    new_impedance_control.Ring.Stiffness = stiff
    new_impedance_control.Ring.SetPoint = r
    new_impedance_control.Pinky.Stiffness = stiff
    new_impedance_control.Pinky.SetPoint = p
    new_impedance_control.has_index = True  # true stand for the command cannot be ignore,false stand for the command can be ignore
    return new_impedance_control




def subscriber():
	host_ip = "127.0.0.1"
	host_port = 55555
	sock = socket(AF_INET, SOCK_STREAM)
	sock.connect((host_ip, host_port))
	print("connected")
	command_write_worker_i=src.command_write_worker(sock)
	command_write_worker_t = threading.Thread(target=command_write_worker_i.worker)
	command_write_worker_t.start()
	rospy.init_node('haptic_writer', anonymous=True)
	new_impedance_control = set_test_impedance_control(0.2,0.2,0.2,0.2,0.2,0.5)
	command_write_worker_i.add_new_impedance_control(337785601,
				                                       new_impedance_control)
	while True:

		#data = rospy.wait_for_message('/glove_setpoint', JointState)
		#t = data.position[0]
		#i = data.position[1]
		#m = data.position[2]
		#r = data.position[3]
		#p = data.position[4]
		#print(t) 
		#new_impedance_control = set_test_impedance_control(t,i,m,r,p,0.5)
		new_impedance_control = set_test_impedance_control(0.2,0.2,0.2,0.2,0.2,0.5)
		command_write_worker_i.add_new_impedance_control(337785601,
				                                       new_impedance_control)  # the id need to be the id of your hands

	


	
subscriber()



