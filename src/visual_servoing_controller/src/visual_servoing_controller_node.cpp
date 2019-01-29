#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/aruco.hpp>
#include <opencv2/calib3d/calib3d.hpp>
#include <sensor_msgs/Temperature.h>
#include <vtec_msgs/TrackingResult.h>
#include <math.h>
#include "dynamixel_gripper/DualGripperGrasp.h"

cv::Mat G = cv::Mat::zeros(3,3,CV_32F);
float score = 0;
<<<<<<< HEAD
float G_l_values[9] = {1.0, 0.0, 195.0, 0.0, 1.0, 115.0, 0.0, 0.0, 1.0};
=======
float G_l_x = 10.0;//145.0;
float G_l_y = 20.0;//65.0;
float G_l_values[9] = {1.0, 0.0, G_l_x, 0.0, 1.0, G_l_y, 0.0, 0.0, 1.0};
>>>>>>> e3b2b9d1ec0e3a7fb7dcd700d1b91ff55ce52220
cv::Mat G_l = cv::Mat(3, 3, CV_32F, G_l_values);
float pi = 3.14159;
int r = 60;
float f = 0.001;
float theta, trace;

void callback(const vtec_msgs::TrackingResult& msg)
{
    // set the homography when a new Tracking Result is received
    geometry_msgs::Twist velocity;

    G.at<float>(0,0) = msg.homography[0];
    G.at<float>(0,1) = msg.homography[1];
    G.at<float>(0,2) = msg.homography[2];
    G.at<float>(1,0) = msg.homography[3];
    G.at<float>(1,1) = msg.homography[4];
    G.at<float>(1,2) = msg.homography[5];
    G.at<float>(2,0) = msg.homography[6];
    G.at<float>(2,1) = msg.homography[7];
    G.at<float>(2,2) = msg.homography[8];
    score = msg.score;
    G = G*G_l.inv(); // G_l = initial guess

}

int main(int argc, char** argv)
{
    // visual servoing controller:
    // subscribes to the vtec tracker and updates the homography
    // calculates the controll error and TCP velocity
    // TCP velocity is published

    // initialize the ros node and subscribe to the /tracking topic from the vtec tracker
    // publish the velocity commands in /visual_servoing_velocity/cmd_vel
    ros::init(argc, argv, "visual_servoing_controller");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("tracking",1, callback);
    ros::Publisher pub = nh.advertise<geometry_msgs::Twist>("/visual_servoing_controller/cmd_vel", 10);
    ros::Publisher pub_control_error = nh.advertise<geometry_msgs::Twist>("/visual_servoing_controller/control_error", 10);
    ros::ServiceClient client = nh.serviceClient<dynamixel_gripper::DualGripperGrasp>("dual_gripper_grasp");

    // message type for the tcp velocity
    geometry_msgs::Twist vel;
    geometry_msgs::Twist msg_control_error;

    // frequency of published messages
    ros::Rate loop_rate(120);
    float gamma = 1.0; // positioning task
    float alpha = 0.7 * 100; // positioning task
    //float alpha = 0.65 * 100; // positioning task
    //float gamma = 0.5; // tracking task
    //float alpha = 0.9 * 100; // tracking task
    // list of parameters
    // camera intrinsics TODO: read parameters from .yaml file
    //float intrinsic_values[9] = {618.431380, 0.0000, 305.399268, 0.0000, 618.606425, 245.923820, 0.0000, 0.0000, 1.0000};
    float intrinsic_values[9] = {700.0, 0.0000, 305.399268, 0.0000, 700.0, 245.923820, 0.0000, 0.0000, 1.0000};
    cv::Mat K = cv::Mat(3, 3, CV_32F, intrinsic_values);
    // parameters from the ddvs conceptional implementation
    cv::Mat H = cv::Mat::zeros(3,3,CV_32F);
    cv::Mat m_norm = cv::Mat::zeros(1,3,CV_32F);
    float control_point[3] = {0.0, 0.0, 1.0};
    //float control_point[3] = {100.0, 100.0, 1.0};
    cv::Mat p = cv::Mat(3,1,CV_32F, control_point);
    float lambda;
    cv::Mat control_mat_1 = cv::Mat::zeros(6,6,CV_32F);
    cv::Mat control_mat_2 = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat H_vex_help = cv::Mat::zeros(3,3,CV_32F);
    //cv::Mat H_vex = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat H_I_m = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat H_I = cv::Mat::zeros(3,3,CV_32F);
    //cv::Mat m_antisym = cv::Mat::zeros(3,3,CV_32F);
    cv::Mat control_error = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat zero = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat zero_r3 = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat velocity_cam = cv::Mat::zeros(6,1,CV_32F);
    cv::Mat velocity_tcp = cv::Mat::zeros(6,1,CV_32F);
    // Transformation matrix from the camera frame to the TCP
    float cam_to_tcp_rot_val[9] = {0.0, 1.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0.0, 1.0};
    cv::Mat cam_to_tcp_rot = cv::Mat(3, 3, CV_32F, cam_to_tcp_rot_val);
    //float cam_to_tcp_tra_skew_val[9] = {0.0, 0.08, 0.12, -0.08, 0.0, 0.0, -0.12, 0.0, 0.0};
    float cam_to_tcp_tra_skew_val[9] = {0.0, 0.0, 0.12, 0.0, 0.0, 0.0, -0.12, 0.0, 0.0};
    cv::Mat cam_to_tcp_tra_skew = cv::Mat(3, 3, CV_32F, cam_to_tcp_tra_skew_val);
    cv::Mat cam_to_tcp;
    cv::Mat cam_to_tcp_h;
    cv::hconcat(cam_to_tcp_rot, cam_to_tcp_tra_skew*cam_to_tcp_rot, cam_to_tcp);
    cv::hconcat(cv::Mat::zeros(3, 3, CV_32F), cam_to_tcp_rot, cam_to_tcp_h);
    cv::vconcat(cam_to_tcp, cam_to_tcp_h, cam_to_tcp);
    //std::cout << cam_to_tcp << std::endl;
    //cv::Mat camera_to_tcp
    int time = 0;
    double control_error_norm;
    double control_error_exp;
<<<<<<< HEAD
    cv::Mat rot = cv::Mat::zeros(3,1,CV_32F);
    cv::Mat u = cv::Mat::zeros(3,1,CV_32F);

    
=======

    nh.param<float>("bbox_pos_x", G_l_x, 200);
    nh.param<float>("bbox_pos_y", G_l_y, 150);

    G_l.at<float>(0,2) = G_l_x;
    G_l.at<float>(1,2) = G_l_y;

>>>>>>> e3b2b9d1ec0e3a7fb7dcd700d1b91ff55ce52220

    while (ros::ok()) {
        //compute control law
        H = K.inv()*G*K;
        m_norm = K.inv()*p;

        // set the values for the control matrix for the calculation of the nonmetric control error
        // according to SILVEIRA et al.: DECOUPLED INTENSITY-BASED NONMETRIC VISUAL SERVO CONTROL
        control_mat_1.at<float>(0,0) = 2.0;
        control_mat_1.at<float>(0,4) = -m_norm.at<float>(0,2);
        control_mat_1.at<float>(0,5) = m_norm.at<float>(0,1);
        control_mat_1.at<float>(1,1) = 2.0;
        control_mat_1.at<float>(1,3) = m_norm.at<float>(0,2);
        control_mat_1.at<float>(1,5) = -m_norm.at<float>(0,0);
        control_mat_1.at<float>(2,2) = 2.0;
        control_mat_1.at<float>(2,3) = -m_norm.at<float>(0,1);
        control_mat_1.at<float>(2,4) = m_norm.at<float>(0,0);
        control_mat_1.at<float>(3,3) = 1.0;
        control_mat_1.at<float>(4,4) = 1.0;
        control_mat_1.at<float>(5,5) = 1.0;
        control_mat_1.at<float>(4,0) = 0.0;//-1.0;
        control_mat_1.at<float>(3,1) = 0.0;//1.0; //speed up, define some param before the while

        H_vex_help = H-H.t();

        H_I = H-cv::Mat::eye(3,3,CV_32F);
        H_I_m = H_I*m_norm;

	rot.at<float>(0,0) = -H_vex_help.at<float>(1,2);
	rot.at<float>(1,0) = H_vex_help.at<float>(0,2);
	rot.at<float>(2,0) = H_vex_help.at<float>(1,0);

	//std::cout << "rot: "<< rot << std::endl;

	//rot_norm = cv::norm(rot, zero, cv::NORM_L2);
	trace = H.at<float>(0,0) + H.at<float>(1,1) + H.at<float>(2,2);
	if(trace >= 1){
		theta = asin(cv::norm(rot, zero_r3, cv::NORM_L2));
	}
	else{
		theta = pi - asin(cv::norm(rot, zero_r3, cv::NORM_L2));
	}
	u = rot/cv::norm(rot, zero_r3, cv::NORM_L2);

        control_mat_2.at<float>(0,0) = H_I_m.at<float>(0,0);
        control_mat_2.at<float>(1,0) = H_I_m.at<float>(1,0);
        control_mat_2.at<float>(2,0) = H_I_m.at<float>(2,0);
        control_mat_2.at<float>(3,0) = u.at<float>(0,0)*theta;
        control_mat_2.at<float>(4,0) = u.at<float>(1,0)*theta;
        control_mat_2.at<float>(5,0) = u.at<float>(2,0)*theta;

        // nonmetric control error and TCP velocity calculation
        control_error = control_mat_1*control_mat_2;
        control_error_norm = cv::norm(control_error, zero, cv::NORM_L2);
        std::cout << "control_err_norm:" << control_error_norm << std::endl;
        //cv::exp(-gamma*control_error_norm, control_error_exp);
        lambda = alpha * exp(-gamma*control_error_norm);
        std::cout << "lambda:" << lambda << std::endl;
        //lambda = alpha * control_error_exp;
        /*control_error.at<float>(0,0) = pow(control_error.at<float>(0,0),3);
        control_error.at<float>(1,0) = pow(control_error.at<float>(1,0),3);
        control_error.at<float>(2,0) = pow(control_error.at<float>(2,0),3);
        control_error.at<float>(3,0) = pow(control_error.at<float>(3,0),3);
        control_error.at<float>(4,0) = pow(control_error.at<float>(4,0),3);
        control_error.at<float>(5,0) = pow(control_error.at<float>(5,0),3);*/

        velocity_cam = lambda*control_error;
        velocity_tcp = cam_to_tcp*velocity_cam;

        msg_control_error.linear.x = control_error.at<float>(0,0);
        msg_control_error.linear.y = control_error.at<float>(1,0);
        msg_control_error.linear.z = control_error.at<float>(2,0);
        msg_control_error.angular.z = control_error.at<float>(3,0);
        msg_control_error.angular.y = control_error.at<float>(4,0);
        msg_control_error.angular.x = control_error.at<float>(5,0);

        // check if the stabilized and warped image is close enough to the reference image
        // if not set the velocities to zero for increased safety
        if (score >= 0.85){ //&& gripper_state == false) {
            vel.linear.x = velocity_tcp.at<float>(0,0);
            vel.linear.y = velocity_tcp.at<float>(1,0);
            vel.linear.z = velocity_tcp.at<float>(2,0);
            vel.angular.x = velocity_tcp.at<float>(5,0);
            vel.angular.y = velocity_tcp.at<float>(4,0);
            vel.angular.z = velocity_tcp.at<float>(3,0);
        }
        else {
            vel.linear.x = 0.0;
            vel.linear.y = 0.0;
            vel.linear.z = 0.0;
            vel.angular.x = 0.0;
            vel.angular.y = 0.0;
            vel.angular.z = 0.0;
        }
    if (control_error_norm < pow(10.0,-3.0)){
            vel.linear.x = 0.0;
            vel.linear.y = 0.0;
            vel.linear.z = 0.0;
            vel.angular.x = 0.0;
            vel.angular.y = 0.0;
            vel.angular.z = 0.0;
    }
    pub_control_error.publish(msg_control_error);
    pub.publish(vel);
    ros::spinOnce();
    loop_rate.sleep();
    time++;
  }
}
