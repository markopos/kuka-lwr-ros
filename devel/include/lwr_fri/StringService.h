// Generated by gencpp from file lwr_fri/StringService.msg
// DO NOT EDIT!


#ifndef LWR_FRI_MESSAGE_STRINGSERVICE_H
#define LWR_FRI_MESSAGE_STRINGSERVICE_H

#include <ros/service_traits.h>


#include <lwr_fri/StringServiceRequest.h>
#include <lwr_fri/StringServiceResponse.h>


namespace lwr_fri
{

struct StringService
{

typedef StringServiceRequest Request;
typedef StringServiceResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct StringService
} // namespace lwr_fri


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::lwr_fri::StringService > {
  static const char* value()
  {
    return "671f8e4998eaec79f1c47e339dfd527b";
  }

  static const char* value(const ::lwr_fri::StringService&) { return value(); }
};

template<>
struct DataType< ::lwr_fri::StringService > {
  static const char* value()
  {
    return "lwr_fri/StringService";
  }

  static const char* value(const ::lwr_fri::StringService&) { return value(); }
};


// service_traits::MD5Sum< ::lwr_fri::StringServiceRequest> should match 
// service_traits::MD5Sum< ::lwr_fri::StringService > 
template<>
struct MD5Sum< ::lwr_fri::StringServiceRequest>
{
  static const char* value()
  {
    return MD5Sum< ::lwr_fri::StringService >::value();
  }
  static const char* value(const ::lwr_fri::StringServiceRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::lwr_fri::StringServiceRequest> should match 
// service_traits::DataType< ::lwr_fri::StringService > 
template<>
struct DataType< ::lwr_fri::StringServiceRequest>
{
  static const char* value()
  {
    return DataType< ::lwr_fri::StringService >::value();
  }
  static const char* value(const ::lwr_fri::StringServiceRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::lwr_fri::StringServiceResponse> should match 
// service_traits::MD5Sum< ::lwr_fri::StringService > 
template<>
struct MD5Sum< ::lwr_fri::StringServiceResponse>
{
  static const char* value()
  {
    return MD5Sum< ::lwr_fri::StringService >::value();
  }
  static const char* value(const ::lwr_fri::StringServiceResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::lwr_fri::StringServiceResponse> should match 
// service_traits::DataType< ::lwr_fri::StringService > 
template<>
struct DataType< ::lwr_fri::StringServiceResponse>
{
  static const char* value()
  {
    return DataType< ::lwr_fri::StringService >::value();
  }
  static const char* value(const ::lwr_fri::StringServiceResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // LWR_FRI_MESSAGE_STRINGSERVICE_H
