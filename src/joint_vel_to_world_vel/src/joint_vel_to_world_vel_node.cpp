#include <ros/ros.h>
#include <std_msgs/MultiArrayLayout.h>
#include <std_msgs/MultiArrayDimension.h>
#include <std_msgs/Float64MultiArray.h>
#include <FastResearchInterface.h>
#include <stdio.h>
#include <lwr_fri/lwr_fri_interface.h>
#include <geometry_msgs/Twist.h>
#include <utils/pseudo_inversion.h>
#include <cstdlib>
/*
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/aruco.hpp>
#include <opencv2/calib3d/calib3d.hpp>
*/
#include "sensor_msgs/JointState.h"
#include "geometry_msgs/WrenchStamped.h"

#define NB_JOINTS 7
#define NB_STATES 6

std_msgs::Float64MultiArray   q_dot_in;
bool joint_states_received = false;
Eigen::MatrixXd             jacobi(NB_STATES,NB_JOINTS);
Eigen::MatrixXd             q_dot(NB_JOINTS,1);

int thrott_time = 10;

void Callback_joint_states(const sensor_msgs::JointState& joint_states)
{
    //ROS_INFO("INSIDE Callback_joint_states");
    q_dot_in.data = joint_states.velocity;
    joint_states_received = true;
}

void Callback_jacobi(const std_msgs::Float64MultiArray& jacobian_matrix)
{

    // ROS_INFO("INSIDE Callback_jacobi");
//jacobian_matrix.data.resize(NB_STATES*NB_JOINTS);
    for(int i=0;i<NB_STATES;i++)
    {
        for(int j=0;j<NB_JOINTS;j++)
        {
            jacobi(i,j) = jacobian_matrix.data[i*7+j];
        }
    }
}

int main(int argc, char** argv)
{
    geometry_msgs::Twist	    vel_tcp_out;
    Eigen::MatrixXd             vel_tcp_calc(NB_STATES,1);

    ros::init(argc, argv, "joint_vel_to_world_vel_node");
    ros::NodeHandle nh;

    //ROS_INFO("Subscribing to topics");
    ros::Subscriber sub = nh.subscribe("/lwr/joint_states",10, Callback_joint_states);
    ros::Subscriber sub_jacobian = nh.subscribe("/lwr/jacobian_matrix",10, Callback_jacobi);
    ros::Publisher pub_joint_state = nh.advertise<geometry_msgs::Twist>("/TCP_measured/vel",10);

 
    // frequency of published messages
    ros::Rate loop_rate(100); //Sending q with 100Hz

        //ROS_INFO("Initializing parameters...");
        // list of parameters
	q_dot_in.data.resize(7);
        q_dot_in.data[0] = 0;
        q_dot_in.data[1] = 0;
        q_dot_in.data[2] = 0;
        q_dot_in.data[3] = 0;
        q_dot_in.data[4] = 0;
        q_dot_in.data[5] = 0;
        q_dot_in.data[6] = 0;
        jacobi = MatrixXd::Identity(NB_STATES,NB_JOINTS);
        vel_tcp_calc(0,0) = 0;
        vel_tcp_calc(1,0) = 0;
        vel_tcp_calc(2,0) = 0;
        vel_tcp_calc(3,0) = 0;
        vel_tcp_calc(4,0) = 0;
        vel_tcp_calc(5,0) = 0;
         //ROS_INFO("...finish");


        while (ros::ok())
         {
           //ROS_INFO_STREAM_THROTTLE(thrott_time,"INSIDE while calc and publish q,q_dot");

	    //MultiArray <- Matrix
            q_dot(0,0) = q_dot_in.data[0];
	    q_dot(1,0) = q_dot_in.data[1];
	    q_dot(2,0) = q_dot_in.data[2];
	    q_dot(3,0) = q_dot_in.data[3];
	    q_dot(4,0) = q_dot_in.data[4];
	    q_dot(5,0) = q_dot_in.data[5];
	    q_dot(6,0) = q_dot_in.data[6];

            vel_tcp_calc = jacobi*q_dot;

            for(int i=0; i<NB_STATES; i++)
            {
                 vel_tcp_out.linear.x = vel_tcp_calc(0,0);
		 vel_tcp_out.linear.y = vel_tcp_calc(1,0);
		 vel_tcp_out.linear.z = vel_tcp_calc(2,0);
		 vel_tcp_out.angular.x = vel_tcp_calc(3,0);
		 vel_tcp_out.angular.y = vel_tcp_calc(4,0);
		 vel_tcp_out.angular.z = vel_tcp_calc(5,0);
            }
		

            //ROS_INFO("After q calc -> rdy to publish q !");

	if(joint_states_received)
	{
            pub_joint_state.publish(vel_tcp_out); //publish tcp velocity
	}
            ros::spinOnce();
            loop_rate.sleep();

          }
}
