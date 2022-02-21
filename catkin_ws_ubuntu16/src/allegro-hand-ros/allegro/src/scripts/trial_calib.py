import numpy as np
from math import cos, sin, pi
from scipy.spatial.transform import Rotation as R

class getcampose:
	def __init__(self):
		print("start camera")

	def getT(self,a,b,c,d,x,y,z):
		r1 = R.from_quat([a,b,c,d])

		r = r1.as_dcm()
		T	 = np.identity(4)
		T[0:3,0:3] = r
		T[0,3] = x
		T[1,3] = y
		T[2,3] = z
		return T

	def getDH(self,l,d,alpha,theta):
		A = np.array([[cos(theta), -sin(theta)*cos(alpha), sin(theta)*sin(alpha), l*cos(theta)],[sin(theta), cos(theta)*cos(alpha), -cos(theta)*sin(alpha), l*sin(theta)],[0, sin(alpha), cos(alpha),d],[0,0,0,1]])
		return A
	
	def main_part(self):
		T1 = self.getT(0.993,0.00545,-0.09952,0.0552,0.071,-0.058,0.2203)

		T2 = self.getT(0.9939,-0.01256,-0.1093,-0.003732,0.0351,-0.00514,0.355)

		Tnetc = (np.matmul(np.linalg.inv(T2),T1))
		handshake = np.array([[0,0,1,0],[1,0,0,0],[0,-1,0,0],[0,0,0,1]])
		Rn = np.array([[1,0,0],[0, cos(-0.0872), -sin(-0.0872)],[0, sin(-0.0872), cos				(-0.0872)]])
		Tn = np.identity(4)
		Tn[0:3,0:3] = (Rn)
		handshake = np.matmul(handshake,Tn)
		A1 = self.getDH(0,0,pi/2,0)
		A2 = self.getDH(0.054,0,0,pi/2-1.61)	
		A3 = self.getDH(0.0384,0,0,0)	
		A4 = self.getDH(0.0267,0,0,0)	
		A = np.matmul(np.matmul(np.matmul(A1,A2),A3),A4)
		Rn = np.array([[1,0,0],[0, cos(-0.0872), -sin(-0.0872)],[0, sin(-0.0872), cos(-0.0872)]])
		pn = np.array([0,0,0.0164])
		pndash = np.matmul(Rn,pn)+np.array([0,0.0435,-0.001542])
		Tn = np.identity(4)
		Tn[0:3,0:3] = Rn
		Tn[0:3,3] = pndash
		Anet = np.matmul(Tn,A)
		Tcalib = np.matmul(Tnetc, np.linalg.inv(np.matmul(Anet,handshake)))
		Tfinal = np.linalg.inv(Tcalib)
		return Tfinal

	def get_campose(self,a,b,c,d,x,y,z):
		cTm = self.getT(a,b,c,d,x,y,z)
		bTm = self.main_part()
		bTc = np.matmul(bTm,np.linalg.inv(cTm))
		return bTc
	

	
	
#camera = getcampose()
#a=0.9987
#b=0.0180
#c=0.0355
#d=0.0302
#x=0.079
#y=0.002
#z=0.3445
#print(camera.get_campose(a,b,c,d,x,y,z))

