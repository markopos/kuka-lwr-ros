// Generated by gencpp from file lwr_fri/FRI.msg
// DO NOT EDIT!


#ifndef LWR_FRI_MESSAGE_FRI_H
#define LWR_FRI_MESSAGE_FRI_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace lwr_fri
{
template <class ContainerAllocator>
struct FRI_
{
  typedef FRI_<ContainerAllocator> Type;

  FRI_()
    : header()
    , name()
    , position()
    , effort()
    , stiffness()
    , damping()
    , FRI_STATE(0)
    , FRI_QUALITY(0)
    , FRI_CTRL(0)
    , ROBOT_CTRL_MODE(0)
    , IsRobotArmPowerOn(false)
    , DoesAnyDriveSignalAnError(false)  {
    }
  FRI_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , name(_alloc)
    , position(_alloc)
    , effort(_alloc)
    , stiffness(_alloc)
    , damping(_alloc)
    , FRI_STATE(0)
    , FRI_QUALITY(0)
    , FRI_CTRL(0)
    , ROBOT_CTRL_MODE(0)
    , IsRobotArmPowerOn(false)
    , DoesAnyDriveSignalAnError(false)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _name_type;
  _name_type name;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _position_type;
  _position_type position;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _effort_type;
  _effort_type effort;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _stiffness_type;
  _stiffness_type stiffness;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _damping_type;
  _damping_type damping;

   typedef int64_t _FRI_STATE_type;
  _FRI_STATE_type FRI_STATE;

   typedef int64_t _FRI_QUALITY_type;
  _FRI_QUALITY_type FRI_QUALITY;

   typedef int64_t _FRI_CTRL_type;
  _FRI_CTRL_type FRI_CTRL;

   typedef int64_t _ROBOT_CTRL_MODE_type;
  _ROBOT_CTRL_MODE_type ROBOT_CTRL_MODE;

   typedef uint8_t _IsRobotArmPowerOn_type;
  _IsRobotArmPowerOn_type IsRobotArmPowerOn;

   typedef uint8_t _DoesAnyDriveSignalAnError_type;
  _DoesAnyDriveSignalAnError_type DoesAnyDriveSignalAnError;





  typedef boost::shared_ptr< ::lwr_fri::FRI_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::lwr_fri::FRI_<ContainerAllocator> const> ConstPtr;

}; // struct FRI_

typedef ::lwr_fri::FRI_<std::allocator<void> > FRI;

typedef boost::shared_ptr< ::lwr_fri::FRI > FRIPtr;
typedef boost::shared_ptr< ::lwr_fri::FRI const> FRIConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::lwr_fri::FRI_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::lwr_fri::FRI_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace lwr_fri

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'lwr_fri': ['/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_fri/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::lwr_fri::FRI_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::lwr_fri::FRI_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lwr_fri::FRI_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lwr_fri::FRI_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lwr_fri::FRI_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lwr_fri::FRI_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::lwr_fri::FRI_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1c34faf79d9377b5acf8f04748e1f1a2";
  }

  static const char* value(const ::lwr_fri::FRI_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1c34faf79d9377b5ULL;
  static const uint64_t static_value2 = 0xacf8f04748e1f1a2ULL;
};

template<class ContainerAllocator>
struct DataType< ::lwr_fri::FRI_<ContainerAllocator> >
{
  static const char* value()
  {
    return "lwr_fri/FRI";
  }

  static const char* value(const ::lwr_fri::FRI_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::lwr_fri::FRI_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n\
string[] name\n\
float64[] position\n\
float64[] effort\n\
float64[] stiffness\n\
float64[] damping\n\
int64 FRI_STATE\n\
int64 FRI_QUALITY\n\
int64 FRI_CTRL\n\
int64 ROBOT_CTRL_MODE\n\
bool IsRobotArmPowerOn\n\
bool DoesAnyDriveSignalAnError\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::lwr_fri::FRI_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::lwr_fri::FRI_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.name);
      stream.next(m.position);
      stream.next(m.effort);
      stream.next(m.stiffness);
      stream.next(m.damping);
      stream.next(m.FRI_STATE);
      stream.next(m.FRI_QUALITY);
      stream.next(m.FRI_CTRL);
      stream.next(m.ROBOT_CTRL_MODE);
      stream.next(m.IsRobotArmPowerOn);
      stream.next(m.DoesAnyDriveSignalAnError);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FRI_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::lwr_fri::FRI_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::lwr_fri::FRI_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "name[]" << std::endl;
    for (size_t i = 0; i < v.name.size(); ++i)
    {
      s << indent << "  name[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name[i]);
    }
    s << indent << "position[]" << std::endl;
    for (size_t i = 0; i < v.position.size(); ++i)
    {
      s << indent << "  position[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.position[i]);
    }
    s << indent << "effort[]" << std::endl;
    for (size_t i = 0; i < v.effort.size(); ++i)
    {
      s << indent << "  effort[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.effort[i]);
    }
    s << indent << "stiffness[]" << std::endl;
    for (size_t i = 0; i < v.stiffness.size(); ++i)
    {
      s << indent << "  stiffness[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.stiffness[i]);
    }
    s << indent << "damping[]" << std::endl;
    for (size_t i = 0; i < v.damping.size(); ++i)
    {
      s << indent << "  damping[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.damping[i]);
    }
    s << indent << "FRI_STATE: ";
    Printer<int64_t>::stream(s, indent + "  ", v.FRI_STATE);
    s << indent << "FRI_QUALITY: ";
    Printer<int64_t>::stream(s, indent + "  ", v.FRI_QUALITY);
    s << indent << "FRI_CTRL: ";
    Printer<int64_t>::stream(s, indent + "  ", v.FRI_CTRL);
    s << indent << "ROBOT_CTRL_MODE: ";
    Printer<int64_t>::stream(s, indent + "  ", v.ROBOT_CTRL_MODE);
    s << indent << "IsRobotArmPowerOn: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.IsRobotArmPowerOn);
    s << indent << "DoesAnyDriveSignalAnError: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.DoesAnyDriveSignalAnError);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LWR_FRI_MESSAGE_FRI_H
