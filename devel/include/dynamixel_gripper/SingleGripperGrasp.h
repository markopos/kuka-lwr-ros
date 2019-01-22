// Generated by gencpp from file dynamixel_gripper/SingleGripperGrasp.msg
// DO NOT EDIT!


#ifndef DYNAMIXEL_GRIPPER_MESSAGE_SINGLEGRIPPERGRASP_H
#define DYNAMIXEL_GRIPPER_MESSAGE_SINGLEGRIPPERGRASP_H

#include <ros/service_traits.h>


#include <dynamixel_gripper/SingleGripperGraspRequest.h>
#include <dynamixel_gripper/SingleGripperGraspResponse.h>


namespace dynamixel_gripper
{

struct SingleGripperGrasp
{

typedef SingleGripperGraspRequest Request;
typedef SingleGripperGraspResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SingleGripperGrasp
} // namespace dynamixel_gripper


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::dynamixel_gripper::SingleGripperGrasp > {
  static const char* value()
  {
    return "f335b9ea2f9d5dd5fcf3d9c70616d213";
  }

  static const char* value(const ::dynamixel_gripper::SingleGripperGrasp&) { return value(); }
};

template<>
struct DataType< ::dynamixel_gripper::SingleGripperGrasp > {
  static const char* value()
  {
    return "dynamixel_gripper/SingleGripperGrasp";
  }

  static const char* value(const ::dynamixel_gripper::SingleGripperGrasp&) { return value(); }
};


// service_traits::MD5Sum< ::dynamixel_gripper::SingleGripperGraspRequest> should match 
// service_traits::MD5Sum< ::dynamixel_gripper::SingleGripperGrasp > 
template<>
struct MD5Sum< ::dynamixel_gripper::SingleGripperGraspRequest>
{
  static const char* value()
  {
    return MD5Sum< ::dynamixel_gripper::SingleGripperGrasp >::value();
  }
  static const char* value(const ::dynamixel_gripper::SingleGripperGraspRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::dynamixel_gripper::SingleGripperGraspRequest> should match 
// service_traits::DataType< ::dynamixel_gripper::SingleGripperGrasp > 
template<>
struct DataType< ::dynamixel_gripper::SingleGripperGraspRequest>
{
  static const char* value()
  {
    return DataType< ::dynamixel_gripper::SingleGripperGrasp >::value();
  }
  static const char* value(const ::dynamixel_gripper::SingleGripperGraspRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::dynamixel_gripper::SingleGripperGraspResponse> should match 
// service_traits::MD5Sum< ::dynamixel_gripper::SingleGripperGrasp > 
template<>
struct MD5Sum< ::dynamixel_gripper::SingleGripperGraspResponse>
{
  static const char* value()
  {
    return MD5Sum< ::dynamixel_gripper::SingleGripperGrasp >::value();
  }
  static const char* value(const ::dynamixel_gripper::SingleGripperGraspResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::dynamixel_gripper::SingleGripperGraspResponse> should match 
// service_traits::DataType< ::dynamixel_gripper::SingleGripperGrasp > 
template<>
struct DataType< ::dynamixel_gripper::SingleGripperGraspResponse>
{
  static const char* value()
  {
    return DataType< ::dynamixel_gripper::SingleGripperGrasp >::value();
  }
  static const char* value(const ::dynamixel_gripper::SingleGripperGraspResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DYNAMIXEL_GRIPPER_MESSAGE_SINGLEGRIPPERGRASP_H
