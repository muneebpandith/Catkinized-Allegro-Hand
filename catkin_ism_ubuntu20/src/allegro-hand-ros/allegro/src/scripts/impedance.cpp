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

double cur_position[16];
double des_vel[16], Kp[16], Kd[16];
double cur_velocity[16], errorpos[16], errorvel[16], t[16];
double compval[16];
double des_position[] = {-0.085, 0.57, 1.045, 1.3555,0.084, 0.85, 0.50, 1.10,
								0.1072, 0.06614, -0.0136, 0.0462,
								1.50, 0.43, 0.22, 1.21};
class Bhand;
void subscribeit(const sensor_msgs::JointState::ConstPtr& msg);
void runit(ros::NodeHandle n);
MatrixXd pseudo(MatrixXd J1);
BHand *instan = NULL;


ros::Subscriber sub;
ros::Publisher pub;
sensor_msgs::JointState joint_state;

int countval=0;
int main(int argc, char **argv)
	
	{
	for (int i=0; i<16; i++)
		{Kp[i] = 0.0;
		Kd[i] = 0;
		t[i] = 0;}
	for (int i=4; i<8; i++)
		{Kp[i] = 0.0;
		Kd[i] = 0.0;
		t[i] = 0;}
	joint_state.position.resize(16);
	joint_state.name.resize(16);
	joint_state.effort.resize(16);
	ros::init(argc, argv,"impedance");

	ros::NodeHandle n;
	//ros::Rate loop_rate(10);
	//std::cout<<ros::ok();
	instan = new BHand(eHandType_Right);
	pub = n.advertise<sensor_msgs::JointState>("/allegroHand_0/torque_cmd",100); 
	runit(n);
	
	for (int i=0; i<16; i++)
		{des_vel[i] = 0;}
	
	delete instan;
	return 0;
	 }


void runit(ros::NodeHandle n)
	{sub = n.subscribe("/allegroHand_0/joint_states", 1, subscribeit);
	ros::spin();}
	

void subscribeit(const sensor_msgs::JointState::ConstPtr& msg)
	{for (int i=0;i<16;i++)
		{cur_position[i] = msg->position[i];}
	//instan->SetJointDesiredPosition(desired_position);
	instan->SetJointPosition(cur_position);
	instan->SetMotionType(eMotionType_GRAVITY_COMP);
	instan->UpdateControl((double) std::time(0));
	instan->CalculateGravity();
	instan->CalculateGravityEx();
	instan->SolveFKRight();
	instan->CalculateJacobian();
	int counter=0;
	for (int i = 0; i<4; i++)
	{	for (int j=0; j<4; j++)
		{compval[counter] = instan->_G[i][j];
		counter++;
		cur_velocity[counter] = instan->_qdot_filtered[i][j];
		}
	} 
	for (int i =0; i<16; i++)
		{	
		errorpos[i] = des_position[i]-cur_position[i];
		errorvel[i] = des_vel[i]-cur_velocity[i];
		t[i] = -compval[i] + Kp[i]*errorpos[i]+Kd[i]*errorvel[i];
		//if (t[i]>1)
		//	{t[i]=1;}
		//if (t[i]<-1)
		//	{t[i]=-1;}
		joint_state.effort[i] = t[i];

	}
	for (int i=0; i<16; i++)
	{
	std::cout<<t[i]<<'\n';
	}	
	pub.publish(joint_state);
	//Jmat = instan->_J;
	
	
}










