#!/usr/bin/env python
import rospy
import csv
from fiducial_msgs.msg import FiducialTransform, FiducialTransformArray


def newTf(data):

	ide = data.transforms[0].fiducial_id

	if ide == 107:
		print(ide)
		tr = data.transforms[0].transform.translation
		ro = data.transforms[0].transform.rotation
	# [tr.x,tr.y,tr.z,ro.x,ro.y,ro.z,ro.w,data.header.stamp.secs,data.header.stamp.nsecs, data.header.seq, data.image_seq]
	#4 for rot
		arr = [tr.x,tr.y,tr.z,ro.x,ro.y,ro.z,ro.w,data.header.stamp.secs,data.header.stamp.nsecs, data.header.seq, data.image_seq]
		with open('data_allegro_paper.csv', 'w') as f:
			writer = csv.writer(f)
			writer.writerow(arr)
def subscriber():
	rospy.init_node('listener', anonymous=True)
	rospy.Subscriber("/fiducial_transforms", FiducialTransformArray, newTf)

	rospy.spin()

subscriber()
