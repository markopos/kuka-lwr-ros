#include <ros/ros.h>
#include <std_msgs/Float64MultiArray.h>
#include <FastResearchInterface.h>
#include <stdio.h>


int main(int argc, char** argv)
{

	ros::init(argc, argv, "get_curr_Jacobian");
	ros::NodeHandle nh;
	//ros::Publisher pub = nh.advertise<std_msgs::Float64MultiArray>("/.../...", 10);
 
	//
	std_msgs::Float64MultiArray         Jacobian;  	//  # array of data, here Jacobian
	
	//Create object of class FastResearchInterface
	FastResearchInterface FastResearchInterface1("/home/robotlab/catkin_ws/src/get_curr_jacobian/src/980169-FRI-Driver.init");

	float **JacobianMatrix;

	//Reads current Jacobian from the latest data telegram of the KRC unit
	FastResearchInterface1.GetCurrentJacobianMatrix(JacobianMatrix); //call member fct


	for(int i=0;i<6;i++)
	{
		for(int j=0;j<7;j++)
		{
			Jacobian.data[i*7+j] = JacobianMatrix[i][j];
		}
	}

	    // frequency of published messages
	    ros::Rate loop_rate(120);

	for (int i = 0;i < 64; i++) 
	{
	    std::cout << Jacobian.data[i] << std::endl;
	}

		//pub.publish(Jacobian);
		ros::spinOnce();
		loop_rate.sleep();

}
