#include <ros/ros.h>
#include <tf/transform_datatypes.h>
#include <opencv2/core.hpp>
#include <std_msgs/MultiArrayLayout.h>
#include <std_msgs/MultiArrayDimension.h>
#include <std_msgs/Float64MultiArray.h>
#include <stdio.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Twist.h>
#include <cstdlib>
#include <math.h>
#include <tf/tf.h>
#include "sensor_msgs/JointState.h"
//#include <FastResearchInterface.h>
//#include <utils/pseudo_inversion.h>


#define NB_JOINTS 7
#define NB_STATES 6

geometry_msgs::Twist pose, dir_tcp, dir_cam, pose_tcp;
std_msgs::Float64MultiArray   q_in;
double roll, pitch, yaw;
float scale_lin = 10.0;
float scale_ang = 1.0;
tf::Matrix3x3 rotmatrix;//, rm;
//double sqw, sqx, sqy, sqz,m00,m01,m02,m10,m11,m12,m20,m21,m22,qy, qw,qx,qz;
//cv::Mat m, rm, rot, u;
//float theta, trace;
float pi = 3.14159;
//double rot_norm;
geometry_msgs::Pose position;
tf::Quaternion quaternion;
cv::Mat jacobimatrix = cv::Mat::eye(NB_STATES,NB_JOINTS,CV_32F);
std_msgs::Float64MultiArray state_x;
bool marker_visible = false;
float d[NB_JOINTS];
geometry_msgs::Pose EEPoseWorld;


// 30 Hz
void Callback_marker(const geometry_msgs::PoseStamped& pose_st)
{	

pose.linear.x = pose_st.pose.position.x;
pose.linear.y = pose_st.pose.position.y;
pose.linear.z = pose_st.pose.position.z;
/*
position.position.x = pose_st.pose.position.x;
position.position.y = pose_st.pose.position.y;
position.position.z = pose_st.pose.position.z;
*/
position.orientation.w = pose_st.pose.orientation.w;
position.orientation.y = pose_st.pose.orientation.y;
position.orientation.z = pose_st.pose.orientation.z;
position.orientation.x = pose_st.pose.orientation.x;

tf::Quaternion q(pose_st.pose.orientation.x, pose_st.pose.orientation.y, pose_st.pose.orientation.z, pose_st.pose.orientation.w);
tf::Matrix3x3 m(q);
//rotmatrix  = m;
m.getRPY(roll, pitch, yaw);
pose.angular.x = roll;
pose.angular.y = pitch;
pose.angular.z = yaw;

std::cout << "pose_marker: "<< pose << std::endl;

marker_visible = true;
}

//100 Hz
void Callback_jacobi(const std_msgs::Float64MultiArray& jacobian_matrix)
{
    for(int i=0;i<NB_STATES;i++)
    {
        for(int j=0;j<NB_JOINTS;j++)
        {
            jacobimatrix.at<float>(i,j) = jacobian_matrix.data[i*7+j];
        }
    }
}

void Callback_joint_states(const sensor_msgs::JointState& joint_states)
{	
	//100 Hz
    //ROS_INFO("INSIDE Callback_joint_states");
    q_in.data = joint_states.position;
    //joint_states_received = true;
}



int main(int argc, char** argv)
{
   
    ros::init(argc, argv, "marker_pos");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("/aruco_single/pose",10, Callback_marker);
    ros::Subscriber sub_q = nh.subscribe("/lwr/joint_states",10, Callback_joint_states);
    ros::Publisher pub = nh.advertise<geometry_msgs::Pose>("/lwr/joint_controllers/command_pos", 10);
    ros::Publisher pub_cmd_joint = nh.advertise<std_msgs::Float64MultiArray >("/lwr/joint_controllers/command_joint_pos",10);
    ros::Subscriber sub_jacobian = nh.subscribe("/lwr/jacobian_matrix",10, Callback_jacobi);
    ros::Publisher pub_cmd_pose = nh.advertise<geometry_msgs::Pose>("/lwr/joint_controllers/command_pos", 10);

    // frequency of published messages
    ros::Rate loop_rate(100); //Sending q with 100Hz

    // Transformation matrix from the camera frame to the TCP
    float cam_to_tcp_rot_val[3][3] = {{0.0, 1.0, 0.0}, {-1.0, 0.0, 0.0}, {0.0, 0.0, 1.0}}; //rot around z axis
    cv::Mat cam_to_tcp_rot = cv::Mat(3, 3, CV_32F, cam_to_tcp_rot_val);
    float cam_to_tcp_tra_skew_val[9] = {0.0, 0.0, 0.12, 0.0, 0.0, 0.0, -0.12, 0.0, 0.0};
    cv::Mat cam_to_tcp_tra_skew = cv::Mat(3, 3, CV_32F, cam_to_tcp_tra_skew_val);
    cv::Mat cam_to_tcp;
    cv::Mat cam_to_tcp_h;
    cv::hconcat(cam_to_tcp_rot, cam_to_tcp_tra_skew*cam_to_tcp_rot, cam_to_tcp);
    cv::hconcat(cv::Mat::zeros(3, 3, CV_32F), cam_to_tcp_rot, cam_to_tcp_h);
    cv::vconcat(cam_to_tcp, cam_to_tcp_h, cam_to_tcp);
   /* cv::Mat direction_cam = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat direction_tcp = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat zero = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat m = cv::Mat::zeros(3,3,CV_32F);
    cv::Mat rm = cv::Mat::zeros(3,3,CV_32F);*/
    cv::Mat pose_cam = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat pose_cam_3 = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat pose_cam_x3 = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat pose_tcp = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat pose_tcp_3 = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat pose_tcp_x3 = cv::Mat::zeros(3,1,CV_32F);
    //cv::Mat jacobimatrix = cv::Mat::eye(NB_STATES,NB_JOINTS,CV_32F);
    cv::Mat pinv = cv::Mat::eye(NB_JOINTS,NB_STATES,CV_32F);
    cv::Mat pose_m = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat x_m = cv::Mat::zeros(4,1,CV_32F);;
    q_in.data.resize(NB_JOINTS);
    //cv::Mat alpha = cv::Mat::(7,1,CV_32F, {-pi/2, pi/2, pi/2, -pi/2, -pi/2, p/2, 0});
    //cv::Mat d = cv::Mat::(7,1,CV_32F, {0.313, 0.0, 0.4, 0, 0.390, 0, 0.100}); //überprüfe Werte, v.a den letzten
    cv::Mat T07 = cv::Mat::zeros(4,4,CV_32F);
    cv::Mat pose_tcp_hom = cv::Mat::zeros(4,1,CV_32F);

	double matrix01[4][4]= {{cos(q_in.data[1]), 0, -sin(q_in.data[1]), 0},
		{sin(q_in.data[1]), 0, cos(q_in.data[1]), 0},
		{0, -1, 0, 0.313},
		{0, 0, 0, 1}};
	cv::Mat T1 = cv::Mat(4,4,CV_32F, matrix01);

	double matrix12[4][4] = {{cos(q_in.data[2]), 0, sin(q_in.data[2]), 0},
		{sin(q_in.data[2]), 0, -cos(q_in.data[2]), 0},
		{0, 1, 0, 0},
		{0, 0, 0, 1}};
	cv::Mat T2 = cv::Mat(4,4,CV_32F, matrix12);

	double matrix23[4][4] = {{cos(q_in.data[3]), 0, sin(q_in.data[3]), 0},
		{sin(q_in.data[3]), 0, -cos(q_in.data[3]), 0},
		{0, 1, 0, 0.4},
		{0, 0, 0, 1}};
	cv::Mat T3 = cv::Mat(4,4,CV_32F, matrix23);

	double matrix34[4][4] = {{cos(q_in.data[4]), 0, -sin(q_in.data[4]), 0},
		{sin(q_in.data[4]),0, cos(q_in.data[4]), 0},
		{0, -1, 0, 0},
		{0, 0, 0, 1}};
	cv::Mat T4 = cv::Mat(4,4,CV_32F, matrix34);

	double matrix45[4][4] = {{cos(q_in.data[5]), 0, -sin(q_in.data[5]), 0},
		{sin(q_in.data[5]), 0, cos(q_in.data[5]), 0},
		{0, -1, 0, 0.390},
		{0, 0, 0, 1}};
	cv::Mat T5 = cv::Mat(4,4,CV_32F, matrix45);

	double matrix56[4][4] = {{cos(q_in.data[6]), 0, sin(q_in.data[6]), 0},
		{sin(q_in.data[6]), 0, -cos(q_in.data[6]), 0},
		{0, 1, 0, 0},
		{0, 0, 0, 1}};
	cv::Mat T6 = cv::Mat(4,4,CV_32F, matrix56);

	double matrix67[4][4] = {{cos(q_in.data[7]), -sin(q_in.data[7]), 0, 0},
		{sin(q_in.data[7]), cos(q_in.data[7]), 0, 0},
		{0, 0, 1, 0.100},
		{0, 0, 0, 1}};
	cv::Mat T7 = cv::Mat(4,4,CV_32F, matrix67);



    while (ros::ok())
     {

	//4x4
	cv::Mat T07 = T1*T2*T3*T4*T5*T6*T7; //Analytical Kinematic of KUKA LWR4 7dof


/*
sqw = qw*qw;
sqx = qx*qx;;
sqy = qy*qy;;
sqz = qz*qz;;

	/*std::cout << "qw: "<< qw << std::endl;
	std::cout << "qz: "<< qz << std::endl;
	std::cout << "qy: "<< qy << std::endl;
	std::cout << "qx: "<< qx << std::endl;*/
    // invs (inverse square length) is only required if quaternion is not already normalised
   /* float invs = 1 / (sqx + sqy + sqz + sqw);
    m00 = ( sqx - sqy - sqz + sqw)*invs ; // since sqw + sqx + sqy + sqz =1/invs*invs
    m11 = (-sqx + sqy - sqz + sqw)*invs ;
    m22 = (-sqx - sqy + sqz + sqw)*invs ;
    
    float tmp1 = qx*qy;
    float tmp2 = qz*qw;
    m10 = 2.0 * (tmp1 + tmp2)*invs ;
    m01 = 2.0 * (tmp1 - tmp2)*invs ;
    
    tmp1 = qx*qz;
    tmp2 = qy*qw;
    m20 = 2.0 * (tmp1 - tmp2)*invs ;
    m02 = 2.0 * (tmp1 + tmp2)*invs ;
    tmp1 = qy*qz;
    tmp2 = qx*qw;
    m21 = 2.0 * (tmp1 + tmp2)*invs ;
    m12 = 2.0 * (tmp1 - tmp2)*invs ;      

m.at<float>(0,0) = m00;
m.at<float>(0,1) = m01;
m.at<float>(0,2) = m02;
m.at<float>(1,0) = m10;
m.at<float>(1,1) = m11;
m.at<float>(1,2) = m12;
m.at<float>(2,0) = m20;
m.at<float>(2,1) = m21;
m.at<float>(2,2) = m22;

	//std::cout << "m: "<< m << std::endl;

//cv::Mat mat = m.t();

rm = 0.5*(m - m.t());

rot.at<float>(0,0) = -rm.at<float>(1,2);
rot.at<float>(1,0) = rm.at<float>(0,2);
rot.at<float>(2,0) = rm.at<float>(1,0);

	//std::cout << "rot: "<< rot << std::endl;

	//rot_norm = cv::norm(rot, zero, cv::NORM_L2);
	trace = m.at<float>(0,0) + m.at<float>(1,1) + m.at<float>(2,2);
	if(trace >= 1){
		theta = asin(cv::norm(rot, zero, cv::NORM_L2));
	}
	else{
		theta = pi - asin(cv::norm(rot, zero, cv::NORM_L2));
	}
	u = rot/cv::norm(rot, zero, cv::NORM_L2);;

	//std::cout << "u: "<< u << std::endl;


	dir_cam.linear.x = (pose.linear.x - pose_old.linear.x);
	dir_cam.linear.y = (pose.linear.y - pose_old.linear.y);
	dir_cam.linear.z = (pose.linear.z - pose_old.linear.z);

	dir_cam.angular.x = u.at<float>(0,0)*theta;
	dir_cam.angular.y = u.at<float>(1,0)*theta;
	dir_cam.angular.z = u.at<float>(2,0)*theta;*/

	/*pose_cam.at<float>(0,0) = pose.linear.x;
	pose_cam.at<float>(1,0) = pose.linear.y;
	pose_cam.at<float>(2,0) = pose.linear.z;// -0.05;
	pose_cam.at<float>(3,0) = 0;//pose.angular.z;
	pose_cam.at<float>(4,0) = 0;//pose.angular.y;
	pose_cam.at<float>(5,0) = 0;//pose.angular.x;*/

	pose_cam_3.at<float>(0,0) = pose.linear.x;
	pose_cam_3.at<float>(1,0) = pose.linear.y;
	pose_cam_3.at<float>(2,0) = pose.linear.z - 0.4;

	pose_cam_x3.at<float>(3,0) = pose.angular.z;
	pose_cam_x3.at<float>(4,0) = pose.angular.y;
	pose_cam_x3.at<float>(5,0) = pose.angular.x;

 	pose_tcp_3 = cam_to_tcp_rot * pose_cam_3;
 	pose_tcp_x3 = cam_to_tcp_rot * pose_cam_x3;

	//pose_tcp = cam_to_tcp * pose_cam;

	pose_tcp.at<float>(0,0) = pose_tcp_3.at<float>(0,0);
	pose_tcp.at<float>(1,0) = pose_tcp_3.at<float>(1,0);
	pose_tcp.at<float>(2,0) = pose_tcp_3.at<float>(2,0);

	pose_tcp.at<float>(3,0) = pose_tcp_x3.at<float>(3,0);
	pose_tcp.at<float>(4,0) = pose_tcp_x3.at<float>(4,0);
	pose_tcp.at<float>(5,0) = pose_tcp_x3.at<float>(5,0);

	std::cout << "pose_tcp: "<< pose_tcp << std::endl;

	pose_tcp_hom.at<float>(0,0) = pose_tcp.at<float>(0,0);
	pose_tcp_hom.at<float>(1,0) = pose_tcp.at<float>(1,0);
	pose_tcp_hom.at<float>(2,0) = pose_tcp.at<float>(2,0);
	pose_tcp_hom.at<float>(3,0) = 1.0;
/*
double roll;
double pitch;
double yaw;
	position.position.x = pose_tcp.at<float>(0,0);
	position.position.y = pose_tcp.at<float>(1,0);
	position.position.z = pose_tcp.at<float>(2,0);
	roll = pose_tcp.at<float>(3,0);
	pitch = pose_tcp.at<float>(4,0);
	yaw = pose_tcp.at<float>(5,0);

    geometry_msgs::Quaternion q;
    double t0 = cos(yaw * 0.5);
    double t1 = sin(yaw * 0.5);
    double t2 = cos(roll * 0.5);
    double t3 = sin(roll * 0.5);
    double t4 = cos(pitch * 0.5);
    double t5 = sin(pitch * 0.5);
    q.w = t0 * t2 * t4 + t1 * t3 * t5;
    q.x = t0 * t3 * t4 - t1 * t2 * t5;
    q.y = t0 * t2 * t5 + t1 * t3 * t4;
    q.z = t1 * t2 * t4 - t0 * t3 * t5;

position.orientation.x = q.x;
position.orientation.y = q.y;
position.orientation.z = q.z;
position.orientation.w = q.w;*/

	/*
	dir_tcp.linear.x = direction_tcp.at<float>(0,0)*scale_lin;
	dir_tcp.linear.y = direction_tcp.at<float>(1,0)*scale_lin;
	dir_tcp.linear.z = direction_tcp.at<float>(2,0)*scale_lin;

	dir_tcp.angular.x = 0;// direction_tcp.at<float>(5,0)*scale_ang;
	dir_tcp.angular.y = 0;// direction_tcp.at<float>(4,0)*scale_ang;
	dir_tcp.angular.z = 0;//direction_tcp.at<float>(3,0)*scale_ang;
	
	std::cout << "cam_to_tcp: " << cam_to_tcp << std::endl;
	std::cout << "dir_cam: "<< dir_cam << std::endl;
	std::cout << "pose: "<< position << std::endl;

	pose_m.at<float>(0,0) = pose.linear.x;
	pose_m.at<float>(1,0) = pose.linear.y;
	pose_m.at<float>(2,0) = pose.linear.z;
	pose_m.at<float>(3,0) = pose.angular.x;
	pose_m.at<float>(4,0) = pose.angular.y;
	pose_m.at<float>(5,0) = pose.angular.z;*/

       
	//cv::invert(jacobimatrix, pinv, 1); // DECOMP_SVD      = 1
	//x_m = pinv * pose_tcp;


	// Base <- TCP
	x_m = T07 * pose_tcp_hom;

	
EEPoseWorld.position.x = x_m.at<float>(0,0);
EEPoseWorld.position.y = x_m.at<float>(1,0);
EEPoseWorld.position.z = x_m.at<float>(2,0);

EEPoseWorld.orientation.x = position.orientation.x;
EEPoseWorld.orientation.y = position.orientation.y;
EEPoseWorld.orientation.z = position.orientation.z;
EEPoseWorld.orientation.w = position.orientation.w;


	/*state_x.data.resize(7);
	state_x.data[0] = x_m.at<float>(0,0);
	state_x.data[1] = x_m.at<float>(1,0);
	state_x.data[2] = x_m.at<float>(2,0);	
	state_x.data[3] = x_m.at<float>(3,0);
	state_x.data[4] = x_m.at<float>(4,0);
	state_x.data[5] = x_m.at<float>(5,0);
	state_x.data[6] = x_m.at<float>(6,0);*/

	std::cout << "EEPoseWorld: "<< EEPoseWorld << std::endl;

	if(marker_visible){
	//pub_cmd_joint.publish(state_x);
	pub_cmd_pose.publish(EEPoseWorld);
	}
	marker_visible = false;
        ros::spinOnce();
        loop_rate.sleep();

     }
}
