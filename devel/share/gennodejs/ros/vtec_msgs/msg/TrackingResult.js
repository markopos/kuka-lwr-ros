// Auto-generated. Do not edit!

// (in-package vtec_msgs.msg)


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

class TrackingResult {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.score = null;
      this.homography = null;
      this.alpha = null;
      this.beta = null;
      this.corners = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('score')) {
        this.score = initObj.score
      }
      else {
        this.score = 0.0;
      }
      if (initObj.hasOwnProperty('homography')) {
        this.homography = initObj.homography
      }
      else {
        this.homography = new Array(9).fill(0);
      }
      if (initObj.hasOwnProperty('alpha')) {
        this.alpha = initObj.alpha
      }
      else {
        this.alpha = 0.0;
      }
      if (initObj.hasOwnProperty('beta')) {
        this.beta = initObj.beta
      }
      else {
        this.beta = 0.0;
      }
      if (initObj.hasOwnProperty('corners')) {
        this.corners = initObj.corners
      }
      else {
        this.corners = new Array(4).fill(new geometry_msgs.msg.Point());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrackingResult
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [score]
    bufferOffset = _serializer.float64(obj.score, buffer, bufferOffset);
    // Check that the constant length array field [homography] has the right length
    if (obj.homography.length !== 9) {
      throw new Error('Unable to serialize array field homography - length must be 9')
    }
    // Serialize message field [homography]
    bufferOffset = _arraySerializer.float32(obj.homography, buffer, bufferOffset, 9);
    // Serialize message field [alpha]
    bufferOffset = _serializer.float32(obj.alpha, buffer, bufferOffset);
    // Serialize message field [beta]
    bufferOffset = _serializer.float32(obj.beta, buffer, bufferOffset);
    // Check that the constant length array field [corners] has the right length
    if (obj.corners.length !== 4) {
      throw new Error('Unable to serialize array field corners - length must be 4')
    }
    // Serialize message field [corners]
    obj.corners.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrackingResult
    let len;
    let data = new TrackingResult(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [score]
    data.score = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [homography]
    data.homography = _arrayDeserializer.float32(buffer, bufferOffset, 9)
    // Deserialize message field [alpha]
    data.alpha = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [beta]
    data.beta = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [corners]
    len = 4;
    data.corners = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.corners[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 148;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vtec_msgs/TrackingResult';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7102c9ac7d706a3777e6c6a896f18cf7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float64 score
    float32[9] homography
    float32 alpha
    float32 beta
    geometry_msgs/Point[4] corners
    
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrackingResult(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.score !== undefined) {
      resolved.score = msg.score;
    }
    else {
      resolved.score = 0.0
    }

    if (msg.homography !== undefined) {
      resolved.homography = msg.homography;
    }
    else {
      resolved.homography = new Array(9).fill(0)
    }

    if (msg.alpha !== undefined) {
      resolved.alpha = msg.alpha;
    }
    else {
      resolved.alpha = 0.0
    }

    if (msg.beta !== undefined) {
      resolved.beta = msg.beta;
    }
    else {
      resolved.beta = 0.0
    }

    if (msg.corners !== undefined) {
      resolved.corners = new Array(4)
      for (let i = 0; i < resolved.corners.length; ++i) {
        if (msg.corners.length > i) {
          resolved.corners[i] = geometry_msgs.msg.Point.Resolve(msg.corners[i]);
        }
        else {
          resolved.corners[i] = new geometry_msgs.msg.Point();
        }
      }
    }
    else {
      resolved.corners = new Array(4).fill(new geometry_msgs.msg.Point())
    }

    return resolved;
    }
};

module.exports = TrackingResult;
