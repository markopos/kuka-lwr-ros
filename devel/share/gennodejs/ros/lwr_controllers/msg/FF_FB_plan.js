// Auto-generated. Do not edit!

// (in-package lwr_controllers.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FF_FB_plan {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.times = null;
      this.ff = null;
      this.xd = null;
      this.xd_dot = null;
      this.fb = null;
    }
    else {
      if (initObj.hasOwnProperty('times')) {
        this.times = initObj.times
      }
      else {
        this.times = [];
      }
      if (initObj.hasOwnProperty('ff')) {
        this.ff = initObj.ff
      }
      else {
        this.ff = [];
      }
      if (initObj.hasOwnProperty('xd')) {
        this.xd = initObj.xd
      }
      else {
        this.xd = [];
      }
      if (initObj.hasOwnProperty('xd_dot')) {
        this.xd_dot = initObj.xd_dot
      }
      else {
        this.xd_dot = [];
      }
      if (initObj.hasOwnProperty('fb')) {
        this.fb = initObj.fb
      }
      else {
        this.fb = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FF_FB_plan
    // Serialize message field [times]
    // Serialize the length for message field [times]
    bufferOffset = _serializer.uint32(obj.times.length, buffer, bufferOffset);
    obj.times.forEach((val) => {
      bufferOffset = std_msgs.msg.Time.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [ff]
    // Serialize the length for message field [ff]
    bufferOffset = _serializer.uint32(obj.ff.length, buffer, bufferOffset);
    obj.ff.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Wrench.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [xd]
    // Serialize the length for message field [xd]
    bufferOffset = _serializer.uint32(obj.xd.length, buffer, bufferOffset);
    obj.xd.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [xd_dot]
    // Serialize the length for message field [xd_dot]
    bufferOffset = _serializer.uint32(obj.xd_dot.length, buffer, bufferOffset);
    obj.xd_dot.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Twist.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [fb]
    // Serialize the length for message field [fb]
    bufferOffset = _serializer.uint32(obj.fb.length, buffer, bufferOffset);
    obj.fb.forEach((val) => {
      bufferOffset = std_msgs.msg.Float64MultiArray.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FF_FB_plan
    let len;
    let data = new FF_FB_plan(null);
    // Deserialize message field [times]
    // Deserialize array length for message field [times]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.times = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.times[i] = std_msgs.msg.Time.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [ff]
    // Deserialize array length for message field [ff]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.ff = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.ff[i] = geometry_msgs.msg.Wrench.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [xd]
    // Deserialize array length for message field [xd]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.xd = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.xd[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [xd_dot]
    // Deserialize array length for message field [xd_dot]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.xd_dot = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.xd_dot[i] = geometry_msgs.msg.Twist.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [fb]
    // Deserialize array length for message field [fb]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.fb = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.fb[i] = std_msgs.msg.Float64MultiArray.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.times.length;
    length += 48 * object.ff.length;
    length += 56 * object.xd.length;
    length += 48 * object.xd_dot.length;
    object.fb.forEach((val) => {
      length += std_msgs.msg.Float64MultiArray.getMessageSize(val);
    });
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lwr_controllers/FF_FB_plan';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a96cb59a5005197cccc1498c4103c512';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Time[] times
    geometry_msgs/Wrench[] ff
    geometry_msgs/Pose[] xd
    geometry_msgs/Twist[] xd_dot
    std_msgs/Float64MultiArray[] fb
    
    ================================================================================
    MSG: std_msgs/Time
    time data
    
    ================================================================================
    MSG: geometry_msgs/Wrench
    # This represents force in free space, separated into
    # its linear and angular parts.
    Vector3  force
    Vector3  torque
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
    ================================================================================
    MSG: std_msgs/Float64MultiArray
    # Please look at the MultiArrayLayout message definition for
    # documentation on all multiarrays.
    
    MultiArrayLayout  layout        # specification of data layout
    float64[]         data          # array of data
    
    
    ================================================================================
    MSG: std_msgs/MultiArrayLayout
    # The multiarray declares a generic multi-dimensional array of a
    # particular data type.  Dimensions are ordered from outer most
    # to inner most.
    
    MultiArrayDimension[] dim # Array of dimension properties
    uint32 data_offset        # padding elements at front of data
    
    # Accessors should ALWAYS be written in terms of dimension stride
    # and specified outer-most dimension first.
    # 
    # multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
    #
    # A standard, 3-channel 640x480 image with interleaved color channels
    # would be specified as:
    #
    # dim[0].label  = "height"
    # dim[0].size   = 480
    # dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
    # dim[1].label  = "width"
    # dim[1].size   = 640
    # dim[1].stride = 3*640 = 1920
    # dim[2].label  = "channel"
    # dim[2].size   = 3
    # dim[2].stride = 3
    #
    # multiarray(i,j,k) refers to the ith row, jth column, and kth channel.
    
    ================================================================================
    MSG: std_msgs/MultiArrayDimension
    string label   # label of given dimension
    uint32 size    # size of given dimension (in type units)
    uint32 stride  # stride of given dimension
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FF_FB_plan(null);
    if (msg.times !== undefined) {
      resolved.times = new Array(msg.times.length);
      for (let i = 0; i < resolved.times.length; ++i) {
        resolved.times[i] = std_msgs.msg.Time.Resolve(msg.times[i]);
      }
    }
    else {
      resolved.times = []
    }

    if (msg.ff !== undefined) {
      resolved.ff = new Array(msg.ff.length);
      for (let i = 0; i < resolved.ff.length; ++i) {
        resolved.ff[i] = geometry_msgs.msg.Wrench.Resolve(msg.ff[i]);
      }
    }
    else {
      resolved.ff = []
    }

    if (msg.xd !== undefined) {
      resolved.xd = new Array(msg.xd.length);
      for (let i = 0; i < resolved.xd.length; ++i) {
        resolved.xd[i] = geometry_msgs.msg.Pose.Resolve(msg.xd[i]);
      }
    }
    else {
      resolved.xd = []
    }

    if (msg.xd_dot !== undefined) {
      resolved.xd_dot = new Array(msg.xd_dot.length);
      for (let i = 0; i < resolved.xd_dot.length; ++i) {
        resolved.xd_dot[i] = geometry_msgs.msg.Twist.Resolve(msg.xd_dot[i]);
      }
    }
    else {
      resolved.xd_dot = []
    }

    if (msg.fb !== undefined) {
      resolved.fb = new Array(msg.fb.length);
      for (let i = 0; i < resolved.fb.length; ++i) {
        resolved.fb[i] = std_msgs.msg.Float64MultiArray.Resolve(msg.fb[i]);
      }
    }
    else {
      resolved.fb = []
    }

    return resolved;
    }
};

module.exports = FF_FB_plan;
