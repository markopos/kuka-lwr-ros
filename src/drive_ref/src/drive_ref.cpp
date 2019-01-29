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


int main(int argc, char** argv)
{

    ros::init(argc, argv, "drive_ref");
    ros::NodeHandle nh;
    std_msgs::Float64MultiArray   q_arr;
    //ROS_INFO("Subscribing to topics");
   // ros::Subscriber sub = nh.subscribe("/lwr/joint_states",10, Callback_joint_states);

    ros::Publisher pub = nh.advertise<std_msgs::Float64MultiArray >("/lwr/joint_controllers/command_joint_pos",10);

 
    // frequency of published messages
    ros::Rate loop_rate(1000); //Sending q with 100Hz

        //ROS_INFO("Initializing parameters...");
        // list of parameters
        q_arr.data.resize(NB_JOINTS);


        q_arr.data[0] = -0.6451053023338318;
        q_arr.data[1] = 0.32801616191864014;
        q_arr.data[2] = 1.1523234844207764;
        q_arr.data[3] = -0.6192461848258972;
        q_arr.data[4] = -0.4640597403049469;
        q_arr.data[5] = -0.8155491948127747;
        q_arr.data[6] = -0.12600284814834595;

	
        while (ros::ok())
         {


            //ROS_INFO("After q calc -> rdy to publish q !");

		
            pub.publish(q_arr); //first pub must be triggered by first sub to joint_states!!!


            ros::spinOnce();
            loop_rate.sleep();

          }
}
