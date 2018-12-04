// Generated by gencpp from file lwr_controllers/MultiPriorityTask.msg
// DO NOT EDIT!


#ifndef LWR_CONTROLLERS_MESSAGE_MULTIPRIORITYTASK_H
#define LWR_CONTROLLERS_MESSAGE_MULTIPRIORITYTASK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace lwr_controllers
{
template <class ContainerAllocator>
struct MultiPriorityTask_
{
  typedef MultiPriorityTask_<ContainerAllocator> Type;

  MultiPriorityTask_()
    : links()
    , tasks()  {
    }
  MultiPriorityTask_(const ContainerAllocator& _alloc)
    : links(_alloc)
    , tasks(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _links_type;
  _links_type links;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _tasks_type;
  _tasks_type tasks;





  typedef boost::shared_ptr< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> const> ConstPtr;

}; // struct MultiPriorityTask_

typedef ::lwr_controllers::MultiPriorityTask_<std::allocator<void> > MultiPriorityTask;

typedef boost::shared_ptr< ::lwr_controllers::MultiPriorityTask > MultiPriorityTaskPtr;
typedef boost::shared_ptr< ::lwr_controllers::MultiPriorityTask const> MultiPriorityTaskConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace lwr_controllers

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'lwr_controllers': ['/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> >
{
  static const char* value()
  {
    return "42e011fbf13e33d6ed6e65ac7a0bdf63";
  }

  static const char* value(const ::lwr_controllers::MultiPriorityTask_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x42e011fbf13e33d6ULL;
  static const uint64_t static_value2 = 0xed6e65ac7a0bdf63ULL;
};

template<class ContainerAllocator>
struct DataType< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> >
{
  static const char* value()
  {
    return "lwr_controllers/MultiPriorityTask";
  }

  static const char* value(const ::lwr_controllers::MultiPriorityTask_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32[] links\n\
float64[] tasks\n\
";
  }

  static const char* value(const ::lwr_controllers::MultiPriorityTask_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.links);
      stream.next(m.tasks);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MultiPriorityTask_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::lwr_controllers::MultiPriorityTask_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::lwr_controllers::MultiPriorityTask_<ContainerAllocator>& v)
  {
    s << indent << "links[]" << std::endl;
    for (size_t i = 0; i < v.links.size(); ++i)
    {
      s << indent << "  links[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.links[i]);
    }
    s << indent << "tasks[]" << std::endl;
    for (size_t i = 0; i < v.tasks.size(); ++i)
    {
      s << indent << "  tasks[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.tasks[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // LWR_CONTROLLERS_MESSAGE_MULTIPRIORITYTASK_H
