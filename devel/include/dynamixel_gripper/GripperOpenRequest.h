// Generated by gencpp from file dynamixel_gripper/GripperOpenRequest.msg
// DO NOT EDIT!


#ifndef DYNAMIXEL_GRIPPER_MESSAGE_GRIPPEROPENREQUEST_H
#define DYNAMIXEL_GRIPPER_MESSAGE_GRIPPEROPENREQUEST_H


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
struct GripperOpenRequest_
{
  typedef GripperOpenRequest_<ContainerAllocator> Type;

  GripperOpenRequest_()
    : position(0.0)  {
    }
  GripperOpenRequest_(const ContainerAllocator& _alloc)
    : position(0.0)  {
  (void)_alloc;
    }



   typedef double _position_type;
  _position_type position;





  typedef boost::shared_ptr< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GripperOpenRequest_

typedef ::dynamixel_gripper::GripperOpenRequest_<std::allocator<void> > GripperOpenRequest;

typedef boost::shared_ptr< ::dynamixel_gripper::GripperOpenRequest > GripperOpenRequestPtr;
typedef boost::shared_ptr< ::dynamixel_gripper::GripperOpenRequest const> GripperOpenRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "81d629500ad53a56e7ab2ad1949abc81";
  }

  static const char* value(const ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x81d629500ad53a56ULL;
  static const uint64_t static_value2 = 0xe7ab2ad1949abc81ULL;
};

template<class ContainerAllocator>
struct DataType< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dynamixel_gripper/GripperOpenRequest";
  }

  static const char* value(const ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 position\n\
";
  }

  static const char* value(const ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GripperOpenRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::dynamixel_gripper::GripperOpenRequest_<ContainerAllocator>& v)
  {
    s << indent << "position: ";
    Printer<double>::stream(s, indent + "  ", v.position);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DYNAMIXEL_GRIPPER_MESSAGE_GRIPPEROPENREQUEST_H