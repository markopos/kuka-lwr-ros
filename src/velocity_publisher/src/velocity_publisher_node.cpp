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
  float f = 0.05;

  ros::Rate loop_rate(10);
  ROS_INFO("Sending Test velocity in z-direction (-> tcp up/down");
  while (ros::ok()) {
    msg.linear.x = A*sin(f*time);
    msg.linear.z = A*cos(f*time);
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
