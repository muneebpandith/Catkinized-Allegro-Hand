#include "bhand/BHand.h"
#include <iostream>
#include <ctime>
#include "ros/ros.h"
#include <sensor_msgs/JointState.h>
#include <string> 
#include <eigen3/Eigen/Dense>
#include <eigen3/Eigen/QR>    
#include <std_msgs/Float32.h>

using namespace std;
using namespace Eigen;

double desired_position[16];
double current_torque[16];
double desired_torque[16];
double compval[16];
class Bhand;
void subscribeit(const sensor_msgs::JointState::ConstPtr& msg);
void runit(ros::NodeHandle n);
MatrixXd pseudo(MatrixXd J1);
BHand *instan = NULL;


ros::Subscriber sub;
ros::Publisher pub,pubx,puby, pubz,pubx1,puby1, pubz1,pubx2,puby2, pubz2,pubx3,puby3, pubz3,pubx4,puby4, pubz4, pubext, pubvelocity;
sensor_msgs::JointState joint_state;
std_msgs::Float32 val1,val2,val3, valext, velocity;
MatrixXd J1(3,4);
MatrixXd J2(3,4);
MatrixXd J3(3,4);
MatrixXd J4(3,4);
double Jmat[4][3][4];
VectorXd t1(4);
VectorXd t2(4);
VectorXd t3(4);
VectorXd t4(4);
VectorXd f1(3);
VectorXd f2(3);
VectorXd f3(3);
VectorXd f4(3);
VectorXd f;
MatrixXd J1t(4,3);
MatrixXd J2t(4,3);
MatrixXd J3t(4,3);
MatrixXd J4t(4,3);
MatrixXd J1tinv(3,4);
MatrixXd J2tinv(3,4);
MatrixXd J3tinv(3,4);
MatrixXd J4tinv(3,4);
MatrixXd extra(4,4);
MatrixXd extraan(3,3);
MatrixXd extraaninv(3,3);
VectorXd forcemean(3);
VectorXd qdot(4);
VectorXd vel(3);
VectorXd err(3);
VectorXd zval(1);
double extravec[16];
double valnet[16];
int countval=0;

double unrange[16];
double extraout[16];


int main(int argc, char **argv)
	
	{forcemean(0)=0;
	forcemean(1)=0;
	forcemean(2)=0;
	
	joint_state.position.resize(16);
	joint_state.name.resize(16);
	joint_state.effort.resize(16);
	ros::init(argc, argv,"compensation");

	ros::NodeHandle n;
	//ros::Rate loop_rate(10);
	//std::cout<<ros::ok();
	instan = new BHand(eHandType_Right);
	pub = n.advertise<sensor_msgs::JointState>("/allegroHand_0/grav_compensation",100); 
	pubx1 = n.advertise<std_msgs::Float32>("fx1",100); 
	puby1 = n.advertise<std_msgs::Float32>("fy1",100); 
	pubz1 = n.advertise<std_msgs::Float32>("fz1",100); 
	pubx2 = n.advertise<std_msgs::Float32>("fx2",100); 
	puby2 = n.advertise<std_msgs::Float32>("fy2",100); 
	pubz2 = n.advertise<std_msgs::Float32>("fz2",100); 
	pubx3 = n.advertise<std_msgs::Float32>("fx3",100); 
	puby3 = n.advertise<std_msgs::Float32>("fy3",100); 
	pubz3 = n.advertise<std_msgs::Float32>("fz3",100); 
	pubx4 = n.advertise<std_msgs::Float32>("fx4",100); 
	puby4 = n.advertise<std_msgs::Float32>("fy4",100); 
	pubz4 = n.advertise<std_msgs::Float32>("fz4",100); 
	pubx  = n.advertise<std_msgs::Float32>("fx",100); 
	puby = n.advertise<std_msgs::Float32>("fy",100); 
	pubz = n.advertise<std_msgs::Float32>("fz",100); 
	pubext = n.advertise<std_msgs::Float32>("tor",100); 
	pubvelocity = n.advertise<std_msgs::Float32>("vel",100); 
		

	runit(n);

	
	delete instan;
	return 0;
	 }


void runit(ros::NodeHandle n)
	{sub = n.subscribe("/allegroHand_0/joint_states", 1, subscribeit);
	ros::spin();}
	

void subscribeit(const sensor_msgs::JointState::ConstPtr& msg)
	{
	extraout[0] = -0.05;
	extraout[1] = -0.14;
	extraout[2] = -0.08;
	extraout[3] = -0.03;

	extraout[4] = -0.035;
	extraout[5] = -0.15;
	extraout[6] = -0.09;
	extraout[7] = -0.03;

	extraout[8] = -0.035;
	extraout[9] = -0.15;
	extraout[10] = -0.09;
	extraout[11] = -0.03;

	extraout[12] = 0.17;
	extraout[13] = 0.02;
	extraout[14] = -0.094;
	extraout[15] = -0.04;

	for (int i=0;i<16;i++)
		{desired_position[i] = msg->position[i];
		current_torque[i] = msg->effort[i];}
	//instan->SetJointDesiredPosition(desired_position);
	instan->SetJointPosition(desired_position);
	instan->SetMotionType(eMotionType_GRAVITY_COMP);
	instan->UpdateControl((double) std::time(0));
	instan->CalculateGravity();
	instan->CalculateGravityEx();
	instan->SolveFKRight();
	instan->CalculateJacobian();
	instan->GetJointTorque(desired_torque);

	//Jmat = instan->_J;
	
	for (int i = 0; i<3; i++)
		{ for (int j = 0; j<4; j++)
		{ 	J1(i,j) = instan->_J[0][i][j];
		  	J2(i,j) = instan->_J[1][i][j];
		  	J3(i,j) = instan->_J[2][i][j];
			J4(i,j) = instan->_J[3][i][j];
		}
		}

	int counter=0;
	std::string name;
	std::stringstream ss;
	for (int i = 0; i<4; i++)
	{	for (int j=0; j<4; j++)
		{compval[counter] = instan->_G[i][j];
		unrange[counter] = 0;
		counter++;

		}
	} 

	for (int i = 0; i<16; i++)
	{ss << i;
	
	name.append(ss.str());
	joint_state.name[i]=name;
	joint_state.effort[i]=compval[i];
	joint_state.position[i] = desired_position[i];}
	unrange[0] = 0.05;
	unrange[1] = 0.05;
	unrange[2] = 0.02;
	unrange[3] = 0.046;
	unrange[0+4] = 0.05;
	unrange[1+4] = 0.08;
	unrange[2+4] = 0.01;
	unrange[3+4] = 0.050;
	unrange[0+8] = 0.05;
	unrange[1+8] = 0.05;
	unrange[2+8] = 0.01;
	unrange[3+8] = 0.050;
	unrange[12] = 0.01;
	unrange[13] = 0.07;
	unrange[14] = 0.12;
	unrange[15] = 0.1;
	for (int i=0;i<16;i++)
		{valnet[i] = current_torque[i]-compval[i];
		if (i!=12||i!=13)

			{if (valnet[i]<0 && valnet[i]>extraout[i])
				{valnet[i]=0;
				
				}
			if (valnet[i]<0) {valnet[i]=valnet[i]-extraout[i];}}
		if (i==12||i==13)
			{if (valnet[i]>0 && valnet[i]<extraout[i])
				{valnet[i]=0;}
			if (valnet[i]>0) {valnet[i]=valnet[i]-extraout[i];}}
		if (abs(valnet[i])<unrange[i]){
			valnet[i] = 0;}
		joint_state.effort[i]=valnet[i];
}

	for (int i =0; i<4; i++)
		{t1(i) = valnet[i];
		t2(i) = valnet[i+4];
		t3(i) = valnet[i+8];
		t4(i) = valnet[i+12];
		//std::cout<<" "<<t4(i)<<" "<<current_torque[i+12]-compval[i+12];
	}
	//std::cout<<endl;
	
	J1t = J1.transpose();
	J2t = J2.transpose();
	J3t = J3.transpose();
	J4t = J4.transpose();
	J1tinv = pseudo(J1);
	J2tinv = pseudo(J2);
	J3tinv = pseudo(J3);
	J4tinv = pseudo(J4);

	f1 = J1tinv*t1;
	f2 = J2tinv*t2;
	f3 = J3tinv*t3;
	f4 = J4tinv*t4;
	f = f1+f2+f4;
	forcemean =(forcemean*(countval)+f)/++countval;
	//std::cout<<"J="<<J1tinv<<'\n';
	//std::cout<<"t4="<<t4<<'\n';
	//std::cout<<forcemean<<'\n';
	//extraan = J4*J4t;
	//extraaninv = extraan.inverse();
	//std::cout<<extraan.norm()*extraaninv.norm()<<'\n';
	//std::cout<<f1<<'\n';
	pub.publish(joint_state);
	/*for (int i=0;i<4;i++)
	{qdot(i) = instan->_qdot[0][i];}
	vel(0) = instan->_xdot[0];
	vel(1) = instan->_ydot[0];
	vel(2) = instan->_zdot[0];
	err = J1*qdot-vel;
	
	std::cout<<vel(0)<<'\n';*/
	//std::cout<<f1+f2+f4<<'\n';
	//std::cout<<f(2)<<'\n';
	val1.data = f1(0);
	val2.data = f1(1);
	val3.data = f1(2);
	valext.data = t1(1);
	velocity.data = instan->_qdot_filtered[0][1];
	pubx1.publish(val1);
	puby1.publish(val2);
	pubz1.publish(val3);
	val1.data = f2(0);
	val2.data = f2(1);
	val3.data = f2(2);
	pubx2.publish(val1);
	puby2.publish(val2);
	pubz2.publish(val3);
	val1.data = f3(0);
	val2.data = f3(1);
	val3.data = f3(2);
	pubx3.publish(val1);
	puby3.publish(val2);
	pubz3.publish(val3);
	val1.data = f4(0);
	val2.data = f4(1);
	val3.data = f4(2);
	pubx4.publish(val1);
	puby4.publish(val2);
	pubz4.publish(val3);
	pubext.publish(valext);
	pubvelocity.publish(velocity);
	val1.data = f(0);
	val2.data = f(1);
	val3.data = f(2);
	pubx.publish(val1);
	puby.publish(val2);
	pubz.publish(val3);

}


MatrixXd pseudo(MatrixXd J1){
	MatrixXd J1text(J1.cols(),J1.rows());
	J1text = J1.transpose();
	extra = J1*J1text;
	J1tinv = extra.inverse()*J1;
	return J1tinv;
}













