# -*- coding: utf-8 -*-
from proto_util import message_frame_pb2 as frame
import Queue
import numpy as np
import time


class frame_read_worker:
	def __init__(self, sock):
	        self.sock = sock
	        self.frame_queue = Queue.Queue()
	        # self.client_mes = client_message()  # TODO

	def read_payload_to_frame(self):
		bytes_to_read = self.sock.recv(4)
		#bytes_length = int.from_bytes(bytes_to_read, "little")
		bytes_length = int(bytes_to_read.encode('hex'), 16)		
		message = self.sock.recv(bytes_length)
		new_frame = frame.Frame()
		new_frame.ParseFromString(message)
		return new_frame

	def worker(self):
		a= time.time()
		new_frame = self.read_payload_to_frame()
		print(time.time()-a)
		self.frame_queue.put(new_frame)  # put it into a queue for use
		value = new_frame.frameMessages[0].handMessage
		arr = np.array([value.thumb_rotate,value.thumb_split,value.thumb_bend,value.index_split,value.index_bend, value.middle_split,value.middle_bend,value.ring_split,value.ring_bend,value.pinky_split, value.pinky_bend])
		#print(new_frame)
		return(arr)
		
			#except Exception as e:
			#	print("Exception",e)
			#	return 
		
			

		
