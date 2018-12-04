// Generated by gencpp from file lwr_controllers/PoseRPY.msg
// DO NOT EDIT!


#ifndef LWR_CONTROLLERS_MESSAGE_POSERPY_H
#define LWR_CONTROLLERS_MESSAGE_POSERPY_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Vector3.h>
#include <lwr_controllers/RPY.h>

namespace lwr_controllers
{
template <class ContainerAllocator>
struct PoseRPY_
{
  typedef PoseRPY_<ContainerAllocator> Type;

  PoseRPY_()
    : id(0)
    , position()
    , orientation()  {
    }
  PoseRPY_(const ContainerAllocator& _alloc)
    : id(0)
    , position(_alloc)
    , orientation(_alloc)  {
  (void)_alloc;
    }



   typedef int32_t _id_type;
  _id_type id;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _position_type;
  _position_type position;

   typedef  ::lwr_controllers::RPY_<ContainerAllocator>  _orientation_type;
  _orientation_type orientation;





  typedef boost::shared_ptr< ::lwr_controllers::PoseRPY_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::lwr_controllers::PoseRPY_<ContainerAllocator> const> ConstPtr;

}; // struct PoseRPY_

typedef ::lwr_controllers::PoseRPY_<std::allocator<void> > PoseRPY;

typedef boost::shared_ptr< ::lwr_controllers::PoseRPY > PoseRPYPtr;
typedef boost::shared_ptr< ::lwr_controllers::PoseRPY const> PoseRPYConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::lwr_controllers::PoseRPY_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::lwr_controllers::PoseRPY_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace lwr_controllers

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'lwr_controllers': ['/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::lwr_controllers::PoseRPY_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::lwr_controllers::PoseRPY_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lwr_controllers::PoseRPY_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lwr_controllers::PoseRPY_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lwr_controllers::PoseRPY_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lwr_controllers::PoseRPY_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::lwr_controllers::PoseRPY_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ac4defc6a342778de62991685c2a0dda";
  }

  static const char* value(const ::lwr_controllers::PoseRPY_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xac4defc6a342778dULL;
  static const uint64_t static_value2 = 0xe62991685c2a0ddaULL;
};

template<class ContainerAllocator>
struct DataType< ::lwr_controllers::PoseRPY_<ContainerAllocator> >
{
  static const char* value()
  {
    return "lwr_controllers/PoseRPY";
  }

  static const char* value(const ::lwr_controllers::PoseRPY_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::lwr_controllers::PoseRPY_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#include <lwr_controllers/RPY.h>\n\
\n\
int32 id\n\
geometry_msgs/Vector3 position\n\
RPY orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Vector3\n\
# This represents a vector in free space. \n\
# It is only meant to represent a direction. Therefore, it does not\n\
# make sense to apply a translation to it (e.g., when applying a \n\
# generic rigid transformation to a Vector3, tf2 will only apply the\n\
# rotation). If you want your data to be translatable too, use the\n\
# geometry_msgs/Point message instead.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
================================================================================\n\
MSG: lwr_controllers/RPY\n\
float64 roll\n\
float64 pitch\n\
float64 yaw\n\
";
  }

  static const char* value(const ::lwr_controllers::PoseRPY_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::lwr_controllers::PoseRPY_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.position);
      stream.next(m.orientation);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PoseRPY_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::lwr_controllers::PoseRPY_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::lwr_controllers::PoseRPY_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.id);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
    s << indent << "orientation: ";
    s << std::endl;
    Printer< ::lwr_controllers::RPY_<ContainerAllocator> >::stream(s, indent + "  ", v.orientation);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LWR_CONTROLLERS_MESSAGE_POSERPY_H