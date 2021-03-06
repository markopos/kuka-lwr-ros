// Generated by gencpp from file lwr_fri/StringServiceResponse.msg
// DO NOT EDIT!


#ifndef LWR_FRI_MESSAGE_STRINGSERVICERESPONSE_H
#define LWR_FRI_MESSAGE_STRINGSERVICERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace lwr_fri
{
template <class ContainerAllocator>
struct StringServiceResponse_
{
  typedef StringServiceResponse_<ContainerAllocator> Type;

  StringServiceResponse_()
    : str()  {
    }
  StringServiceResponse_(const ContainerAllocator& _alloc)
    : str(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _str_type;
  _str_type str;





  typedef boost::shared_ptr< ::lwr_fri::StringServiceResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::lwr_fri::StringServiceResponse_<ContainerAllocator> const> ConstPtr;

}; // struct StringServiceResponse_

typedef ::lwr_fri::StringServiceResponse_<std::allocator<void> > StringServiceResponse;

typedef boost::shared_ptr< ::lwr_fri::StringServiceResponse > StringServiceResponsePtr;
typedef boost::shared_ptr< ::lwr_fri::StringServiceResponse const> StringServiceResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::lwr_fri::StringServiceResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::lwr_fri::StringServiceResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace lwr_fri

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'lwr_fri': ['/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_fri/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::lwr_fri::StringServiceResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::lwr_fri::StringServiceResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lwr_fri::StringServiceResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lwr_fri::StringServiceResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lwr_fri::StringServiceResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lwr_fri::StringServiceResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::lwr_fri::StringServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "994972b6e03928b2476860ce6c4c8e17";
  }

  static const char* value(const ::lwr_fri::StringServiceResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x994972b6e03928b2ULL;
  static const uint64_t static_value2 = 0x476860ce6c4c8e17ULL;
};

template<class ContainerAllocator>
struct DataType< ::lwr_fri::StringServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "lwr_fri/StringServiceResponse";
  }

  static const char* value(const ::lwr_fri::StringServiceResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::lwr_fri::StringServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string str\n\
\n\
";
  }

  static const char* value(const ::lwr_fri::StringServiceResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::lwr_fri::StringServiceResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.str);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct StringServiceResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::lwr_fri::StringServiceResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::lwr_fri::StringServiceResponse_<ContainerAllocator>& v)
  {
    s << indent << "str: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.str);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LWR_FRI_MESSAGE_STRINGSERVICERESPONSE_H
