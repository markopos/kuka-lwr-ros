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

#define NB_JOINTS 7
#define NB_STATES 6

std_msgs::Float64MultiArray   q;
std_msgs::Float64MultiArray   q_dot_arr;
bool joint_states_received = false;
Eigen::MatrixXd             jacobimatrix(NB_STATES,NB_JOINTS);
Eigen::MatrixXd             pinv(NB_JOINTS,NB_STATES);
Eigen::MatrixXd             vel_tcp(NB_STATES,1);
Eigen::MatrixXd             q_dot(NB_JOINTS,1);

//float delta = 0.03;
float elapsedtime = 0.01; // f = 100 Hz -> elpasedtime = 0.01
                           //make this variable global

void Callback_joint_states(const sensor_msgs::JointState& joint_states)
{
    ROS_INFO("INSIDE Callback_joint_states");
    q.data = joint_states.position;
    joint_states_received = true;
    //joint_pos.data[0] = joint_pos.data[0] + delta; //Test
}

void Callback_vel_cmd(const geometry_msgs::Twist& velocity)
{
     ROS_INFO("INSIDE Callback_vel_cmd");
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

     ROS_INFO("INSIDE Callback_jacobi");
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


    ros::init(argc, argv, "get_joint_state");
	ros::NodeHandle nh;

    ROS_INFO("Subscribing to topics");
    ros::Subscriber sub = nh.subscribe("/lwr/joint_states",10, Callback_joint_states);
    ros::Subscriber sub_vel = nh.subscribe("/visual_servoing_controller/cmd_vel/",10, Callback_vel_cmd); // change!
    ros::Subscriber sub_jacobian = nh.subscribe("/lwr/jacobian_matrix",10, Callback_jacobi);
    //ros::Publisher pub = nh.advertise<std_msgs::Float64MultiArray >("/lwr/joint_controllers/command_joint_pos",10);
    //ros::Publisher pub = nh.advertise<std_msgs::Float64MultiArray >("/visual_servoing/joint_pos",10);
    ros::Publisher pub = nh.advertise<std_msgs::Float64MultiArray >("/lwr/joint_controllers/command_joint_pos",10);

 
    // frequency of published messages
    ros::Rate loop_rate(100); //Sending q with 100Hz

        ROS_INFO("Initializing parameters...");
        // list of parameters
        q_dot_arr.data.resize(NB_JOINTS);
        q.data.resize(NB_JOINTS);
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
         ROS_INFO("...finish");



        while (ros::ok())
         {
            ROS_INFO("INSIDE while calc and publish q");

            //  PSEUDOCODE
            //qdotk = jacobipseudoinv * vel
            //qk+1 = qk + (jacobipseudoinv * vel) * elapsedtime
            pseudo_inverse(jacobimatrix, pinv, false);
            q_dot = pinv * vel_tcp;

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
                 q.data[i] = q.data[i] + (q_dot_arr.data[i] * elapsedtime);
            }

            q.data.resize(NB_JOINTS);

            //ROS_INFO("After q calc -> rdy to publish q !");

	if(joint_states_received)
	{
            pub.publish(q); //first pub must be triggered by first sub to joint_states!!!
	}
            ros::spinOnce();
            loop_rate.sleep();

          }
}
