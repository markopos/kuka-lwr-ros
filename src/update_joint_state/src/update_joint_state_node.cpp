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

std_msgs::Float64MultiArray   q_in;
bool joint_states_received = false;
Eigen::MatrixXd             jacobimatrix(NB_STATES,NB_JOINTS);
Eigen::MatrixXd             vel_tcp(NB_STATES,1);

int thrott_time = 10;

//float delta = 0.03;
float elapsedtime = 0.01; // f = 100 Hz -> elpasedtime = 0.01
                           //make this variable global

void Callback_joint_states(const sensor_msgs::JointState& joint_states)
{
    //ROS_INFO("INSIDE Callback_joint_states");
    q_in.data = joint_states.position;
    joint_states_received = true;
    //joint_pos.data[0] = joint_pos.data[0] + delta; //Test
}

void Callback_vel_cmd(const geometry_msgs::Twist& velocity)
{
     //ROS_INFO("INSIDE Callback_vel_cmd");
/*
vel_tcp.linear.x = velocity.linear.x;
vel_tcp.linear.y = velocity.linear.y;
vel_tcp.linear.z = velocity.linear.z;

vel_tcp.angular.x = velocity.angular.x;
vel_tcp.angular.y = velocity.angular.y;
vel_tcp.angular.z = velocity.angular.z;
*/
vel_tcp(0,0) = velocity.linear.x;
vel_tcp(1,0) = velocity.linear.y;
vel_tcp(2,0) = velocity.linear.z;

vel_tcp(3,0) = velocity.angular.x;
vel_tcp(4,0) = velocity.angular.y;
vel_tcp(5,0) = velocity.angular.z;


}

void Callback_jacobi(const std_msgs::Float64MultiArray& jacobian_matrix)
{

    // ROS_INFO("INSIDE Callback_jacobi");
//jacobian_matrix.data.resize(NB_STATES*NB_JOINTS);
    for(int i=0;i<NB_STATES;i++)
    {
        for(int j=0;j<NB_JOINTS;j++)
        {
            jacobimatrix(i,j) = jacobian_matrix.data[i*7+j];
        }
    }
}

int main(int argc, char** argv)
{
    std_msgs::Float64MultiArray   q_out;
    std_msgs::Float64MultiArray   q_dot_arr;
    Eigen::MatrixXd             pinv(NB_JOINTS,NB_STATES);
    Eigen::MatrixXd             q_dot(NB_JOINTS,1);
    sensor_msgs::JointState     joint_states_stamped;

    ros::init(argc, argv, "update_joint_state");
	ros::NodeHandle nh;

    //ROS_INFO("Subscribing to topics");
    ros::Subscriber sub = nh.subscribe("/lwr/joint_states",10, Callback_joint_states);
    ros::Subscriber sub_vel = nh.subscribe("/visual_servoing_controller/cmd_vel/",10, Callback_vel_cmd); // change!
    ros::Subscriber sub_jacobian = nh.subscribe("/lwr/jacobian_matrix",10, Callback_jacobi);
    //ros::Publisher pub = nh.advertise<std_msgs::Float64MultiArray >("/lwr/joint_controllers/command_joint_pos",10);
    ros::Publisher pub_q_dot = nh.advertise<std_msgs::Float64MultiArray >("/visual_servoing/q_dot",10);
    ros::Publisher pub = nh.advertise<std_msgs::Float64MultiArray >("/lwr/joint_controllers/command_joint_pos",10);
    ros::Publisher pub_joint_state = nh.advertise<sensor_msgs::JointState>("/visual_servoing/joint_states_timestamped",10);

 
    // frequency of published messages
    ros::Rate loop_rate(100); //Sending q with 100Hz

        //ROS_INFO("Initializing parameters...");
        // list of parameters
        q_dot_arr.data.resize(NB_JOINTS);
        q_out.data.resize(NB_JOINTS);
        q_in.data.resize(NB_JOINTS);
        q_dot_arr.data[0] = 0;
        q_dot_arr.data[1] = 0;
        q_dot_arr.data[2] = 0;
        q_dot_arr.data[3] = 0;
        q_dot_arr.data[4] = 0;
        q_dot_arr.data[5] = 0;
        q_dot_arr.data[6] = 0;
        jacobimatrix = MatrixXd::Identity(NB_STATES,NB_JOINTS);
        vel_tcp(0,0) = 0;
        vel_tcp(1,0) = 0;
        vel_tcp(2,0) = 0;
        vel_tcp(3,0) = 0;
        vel_tcp(4,0) = 0;
        vel_tcp(5,0) = 0;
         //ROS_INFO("...finish");



        while (ros::ok())
         {
           ROS_INFO_STREAM_THROTTLE(thrott_time,"INSIDE while calc and publish q,q_dot");

            //  PSEUDOCODE
            //qdotk = jacobipseudoinv * vel
            //qk+1 = qk + (jacobipseudoinv * vel) * elapsedtime
            pseudo_inverse(jacobimatrix, pinv, false);
            q_dot = pinv * vel_tcp; // q_dot >> joint_states/cmd_vel
    //std::cout << "q_dot: " << q_dot << std::endl;
    //std::cout << "vel_tcp: " << vel_tcp << std::endl;

            //MultiArray <- Matrix
            q_dot_arr.data[0] = q_dot(0,0);
            q_dot_arr.data[1] = q_dot(1,0);
            q_dot_arr.data[2] = q_dot(2,0);
            q_dot_arr.data[3] = q_dot(3,0);
            q_dot_arr.data[4] = q_dot(4,0);
            q_dot_arr.data[5] = q_dot(5,0);
            q_dot_arr.data[6] = q_dot(6,0);
            q_dot_arr.data.resize(7);

            for(int i=0; i<NB_JOINTS; i++)
            {
                 q_out.data[i] = q_in.data[i] + (q_dot_arr.data[i] * elapsedtime);
            }
    //std::cout << "q_in: " << q_in << std::endl;
    //std::cout << "q_out: " << q_out << std::endl;
            //q_out.data.resize(NB_JOINTS);

            joint_states_stamped.header.frame_id   = "joint_states_stamped";
            joint_states_stamped.header.stamp      = ros::Time::now();
            joint_states_stamped.position          = q_out.data;


            //ROS_INFO("After q calc -> rdy to publish q !");

	if(joint_states_received)
	{
            pub.publish(q_out); //first pub must be triggered by first sub to joint_states!!!
            pub_q_dot.publish(q_dot_arr); //publish q_dot
            pub_joint_state.publish(joint_states_stamped); //publish q with time stamp
	}
            ros::spinOnce();
            loop_rate.sleep();

          }
}
