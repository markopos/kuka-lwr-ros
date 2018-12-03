#include <ros/ros.h>
#include <geometry_msgs/Twist.h> 

int main(int argc, char** argv)
{
  ros::init(argc, argv, "velocity_publisher");
  ros::NodeHandle nh;
  ros::Publisher pub = nh.advertise<geometry_msgs::Twist>("/visual_servoing_controller/cmd_vel/", 10);

  geometry_msgs::Twist msg;
  int time = 0;
  float A = 1.0;
  float B = 2.0;
  float C = 1.0;
  float f = 0.05;
  float PI = 3.1415926535897;
  int speed = +200; //unit:[deg/sec]
  float angular_speed = speed*2*PI/360;//deg -> rad

  ros::Rate loop_rate(10);
  ROS_INFO("Sending Test velocity in z-direction (-> tcp up/down");
  while (ros::ok()) {
    //msg.linear.x = A;
    msg.linear.x = B*cos(f*time);
    //msg.linear.y = C;//C*sin(f*time);

    //msg.angular.x = angular_speed; //yaw; roll about Z
    //msg.angular.z = angular_speed*sin(f*time); //unit:[rad/sec]
    //msg.angular.y = angular_speed; // pitch; roll about Y
    //msg.angular.z = angular_speed; // roll; roll about X
    time++;
	pub.publish(msg);
	loop_rate.sleep();
    if (time >= 200 && time%4 == 0) {
        A = 0.95*A;
    }
    if (A <= 0.00001) {
        A = 0;
    }
  }
}
