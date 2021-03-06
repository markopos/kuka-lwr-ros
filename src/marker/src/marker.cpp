#include <ros/ros.h>
#include <tf/transform_datatypes.h>
#include <opencv2/core.hpp>
#include <std_msgs/MultiArrayLayout.h>
#include <std_msgs/MultiArrayDimension.h>
#include <std_msgs/Float64MultiArray.h>
#include <stdio.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Twist.h>
#include <cstdlib>
#include <math.h>

geometry_msgs::Twist pose, dir_tcp, dir_cam, pose_old, vel_tcp;
double roll, pitch, yaw;
float scale_lin = 4.0;
float scale_ang = 1.0;
tf::Matrix3x3 rotmatrix;//, rm;
double sqw, sqx, sqy, sqz,m00,m01,m02,m10,m11,m12,m20,m21,m22,qy, qw,qx,qz;
//cv::Mat m, rm, rot, u;
float theta, trace;
float pi = 3.14159;
//double rot_norm;
bool marker_visible = false;

// 30 Hz
void Callback(const geometry_msgs::PoseStamped& pose_st)
{	
pose.linear.x = pose_st.pose.position.x;
pose.linear.y = pose_st.pose.position.y;
pose.linear.z = pose_st.pose.position.z;

qw = pose_st.pose.orientation.w;
qy = pose_st.pose.orientation.y;
qz = pose_st.pose.orientation.z;
qx = pose_st.pose.orientation.x;
//std::cout << "pose: "<< pose_st.pose.orientation << std::endl;

tf::Quaternion q(pose_st.pose.orientation.x, pose_st.pose.orientation.y, pose_st.pose.orientation.z, pose_st.pose.orientation.w);
tf::Matrix3x3 m(q);
rotmatrix  = m;
m.getRPY(roll, pitch, yaw);
pose.angular.x = roll;
pose.angular.y = pitch;
pose.angular.z = yaw;

marker_visible = true;
std::cout << "Inside Callback_marker"<< std::endl;
}



int main(int argc, char** argv)
{
   
    ros::init(argc, argv, "marker");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("/aruco_single/pose",10, Callback);
    ros::Publisher pub = nh.advertise<geometry_msgs::Twist>("/visual_servoing_controller/cmd_vel/", 10);
    //ros::Publisher pub_pos = nh.advertise<geometry_msgs::Twist>("/visual_servoing_controller/cmd_vel/", 10);
 
 
    // frequency of published messages
    ros::Rate loop_rate(30); //Sending q with 100Hz

    // Transformation matrix from the camera frame to the TCP
    float cam_to_tcp_rot_val[9] = {0.0, 1.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0.0, 1.0}; //rot around z axis
    cv::Mat cam_to_tcp_rot = cv::Mat(3, 3, CV_32F, cam_to_tcp_rot_val);
    float cam_to_tcp_tra_skew_val[9] = {0.0, 0.0, 0.12, 0.0, 0.0, 0.0, -0.12, 0.0, 0.0};
    cv::Mat cam_to_tcp_tra_skew = cv::Mat(3, 3, CV_32F, cam_to_tcp_tra_skew_val);
    cv::Mat cam_to_tcp;
    cv::Mat cam_to_tcp_h;
    cv::hconcat(cam_to_tcp_rot, cam_to_tcp_tra_skew*cam_to_tcp_rot, cam_to_tcp);
    cv::hconcat(cv::Mat::zeros(3, 3, CV_32F), cam_to_tcp_rot, cam_to_tcp_h);
    cv::vconcat(cam_to_tcp, cam_to_tcp_h, cam_to_tcp);
    cv::Mat direction_cam = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat direction_tcp = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat velocity_tcp = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat zero = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat m = cv::Mat::zeros(3,3,CV_32F);
    cv::Mat rm = cv::Mat::zeros(3,3,CV_32F);
    cv::Mat rot = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat u = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat zero_6 = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat dir_cam_lin = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat dir_cam_ang = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat dir_tcp_lin = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat dir_tcp_ang = cv::Mat::zeros(3,1,CV_32F);
    float gamma = 1.0; // positioning task
    float alpha = 0.5 * 100; // positioning task
    double dir_tcp_norm;
    float lambda;


    while (ros::ok())
     {
sqw = qw*qw;
sqx = qx*qx;;
sqy = qy*qy;;
sqz = qz*qz;;

	/*std::cout << "qw: "<< qw << std::endl;
	std::cout << "qz: "<< qz << std::endl;
	std::cout << "qy: "<< qy << std::endl;
	std::cout << "qx: "<< qx << std::endl;*/
    // invs (inverse square length) is only required if quaternion is not already normalised
    float invs = 1 / (sqx + sqy + sqz + sqw);
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


	dir_cam.linear.x = (pose.linear.x);;//- pose_old.linear.x);
	dir_cam.linear.y = (pose.linear.y);//- pose_old.linear.y);
	dir_cam.linear.z = (pose.linear.z - 0.4); //- pose_old.linear.z);

	dir_cam.angular.x = u.at<float>(0,0)*theta;
	dir_cam.angular.y = u.at<float>(1,0)*theta;
	dir_cam.angular.z = u.at<float>(2,0)*theta;

	direction_cam.at<float>(0,0) = dir_cam.linear.x;
	direction_cam.at<float>(1,0) = dir_cam.linear.y;
	direction_cam.at<float>(2,0) = dir_cam.linear.z;
	direction_cam.at<float>(3,0) = dir_cam.angular.x;
	direction_cam.at<float>(4,0) = dir_cam.angular.y;
	direction_cam.at<float>(5,0) = dir_cam.angular.z;

	direction_tcp = cam_to_tcp*direction_cam;

	dir_cam_lin.at<float>(0,0) = direction_cam.at<float>(0,0);
	dir_cam_lin.at<float>(1,0) = direction_cam.at<float>(1,0);
	dir_cam_lin.at<float>(2,0) = direction_cam.at<float>(2,0);

	dir_cam_ang.at<float>(0,0) = direction_cam.at<float>(3,0);
	dir_cam_ang.at<float>(1,0) = direction_cam.at<float>(4,0);
	dir_cam_ang.at<float>(2,0) = direction_cam.at<float>(5,0);

 	//dir_tcp_lin = cam_to_tcp_rot * dir_cam_lin;
 	//dir_tcp_ang = cam_to_tcp_rot * dir_cam_ang;

	/*dir_tcp_norm = cv::norm(direction_tcp, zero_6, cv::NORM_L2);
	lambda = alpha * exp(-gamma*dir_tcp_norm);*/

	dir_tcp_norm = cv::norm(direction_tcp, zero_6, cv::NORM_L2);
	lambda = 1;//alpha * exp(-gamma*dir_tcp_norm);

	velocity_tcp = lambda * direction_tcp;
	//dir_tcp_lin = lambda * dir_tcp_lin;
	//dir_tcp_ang = lambda * dir_tcp_ang;

	if(marker_visible){ // && norm >= 0.1
	vel_tcp.linear.x = velocity_tcp.at<float>(0,0)*scale_lin;
	vel_tcp.linear.y = velocity_tcp.at<float>(1,0)*scale_lin;
	vel_tcp.linear.z = velocity_tcp.at<float>(2,0)*scale_lin;

	/*dir_tcp.linear.x = dir_tcp_lin.at<float>(0,0);//*scale_lin;
	dir_tcp.linear.y = dir_tcp_lin.at<float>(1,0);//*scale_lin;
	dir_tcp.linear.z = dir_tcp_lin.at<float>(2,0);//*scale_lin;*/

	/*dir_tcp.angular.x = dir_tcp_ang.at<float>(0,0);//0;//direction_tcp.at<float>(5,0);//*scale_ang;
	dir_tcp.angular.y = dir_tcp_ang.at<float>(1,0);//0;//direction_tcp.at<float>(4,0);//*scale_ang;
	dir_tcp.angular.z = dir_tcp_ang.at<float>(2,0);//0;//direction_tcp.at<float>(3,0);//*scale_ang;*/

	vel_tcp.angular.x = velocity_tcp.at<float>(5,0);//*scale_ang;
	vel_tcp.angular.y = velocity_tcp.at<float>(4,0);//*scale_ang;
	vel_tcp.angular.z = velocity_tcp.at<float>(3,0);//*scale_ang;
	}
	else{
	vel_tcp.linear.x = 0;
	vel_tcp.linear.y = 0;
	vel_tcp.linear.z = 0;
	vel_tcp.angular.x = 0;
	vel_tcp.angular.y = 0;
	vel_tcp.angular.z = 0;
	std::cout << "sending zero velocity"<< std::endl;
	}
	
	std::cout << "dir_cam: "<< dir_cam << std::endl;
	std::cout << "dir_tcp: "<< direction_tcp << std::endl;
	std::cout << "dir_tcp_norm: "<< dir_tcp_norm << std::endl;

	//if(marker_visible){ 
	pub.publish(vel_tcp); 
	//}
	marker_visible = false;
	//pose_old = pose;
        ros::spinOnce();
        loop_rate.sleep();

     }
}
