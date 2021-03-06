// Generated by gencpp from file dynamixel_gripper/GripperOpenResponse.msg
// DO NOT EDIT!


#ifndef DYNAMIXEL_GRIPPER_MESSAGE_GRIPPEROPENRESPONSE_H
#define DYNAMIXEL_GRIPPER_MESSAGE_GRIPPEROPENRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace dynamixel_gripper
{
template <class ContainerAllocator>
struct GripperOpenResponse_
{
  typedef GripperOpenResponse_<ContainerAllocator> Type;

  GripperOpenResponse_()
    : goal_reached(false)  {
    }
  GripperOpenResponse_(const ContainerAllocator& _alloc)
    : goal_reached(false)  {
  (void)_alloc;
    }



   typedef uint8_t _goal_reached_type;
  _goal_reached_type goal_reached;





  typedef boost::shared_ptr< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GripperOpenResponse_

typedef ::dynamixel_gripper::GripperOpenResponse_<std::allocator<void> > GripperOpenResponse;

typedef boost::shared_ptr< ::dynamixel_gripper::GripperOpenResponse > GripperOpenResponsePtr;
typedef boost::shared_ptr< ::dynamixel_gripper::GripperOpenResponse const> GripperOpenResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace dynamixel_gripper

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a65bc774d2139031955fd7cc94fdd40f";
  }

  static const char* value(const ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa65bc774d2139031ULL;
  static const uint64_t static_value2 = 0x955fd7cc94fdd40fULL;
};

template<class ContainerAllocator>
struct DataType< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dynamixel_gripper/GripperOpenResponse";
  }

  static const char* value(const ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool goal_reached\n\
";
  }

  static const char* value(const ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.goal_reached);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GripperOpenResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::dynamixel_gripper::GripperOpenResponse_<ContainerAllocator>& v)
  {
    s << indent << "goal_reached: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.goal_reached);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DYNAMIXEL_GRIPPER_MESSAGE_GRIPPEROPENRESPONSE_H
