// Auto-generated. Do not edit!

// (in-package lwr_fri.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FRI {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.name = null;
      this.position = null;
      this.effort = null;
      this.stiffness = null;
      this.damping = null;
      this.FRI_STATE = null;
      this.FRI_QUALITY = null;
      this.FRI_CTRL = null;
      this.ROBOT_CTRL_MODE = null;
      this.IsRobotArmPowerOn = null;
      this.DoesAnyDriveSignalAnError = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = [];
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = [];
      }
      if (initObj.hasOwnProperty('effort')) {
        this.effort = initObj.effort
      }
      else {
        this.effort = [];
      }
      if (initObj.hasOwnProperty('stiffness')) {
        this.stiffness = initObj.stiffness
      }
      else {
        this.stiffness = [];
      }
      if (initObj.hasOwnProperty('damping')) {
        this.damping = initObj.damping
      }
      else {
        this.damping = [];
      }
      if (initObj.hasOwnProperty('FRI_STATE')) {
        this.FRI_STATE = initObj.FRI_STATE
      }
      else {
        this.FRI_STATE = 0;
      }
      if (initObj.hasOwnProperty('FRI_QUALITY')) {
        this.FRI_QUALITY = initObj.FRI_QUALITY
      }
      else {
        this.FRI_QUALITY = 0;
      }
      if (initObj.hasOwnProperty('FRI_CTRL')) {
        this.FRI_CTRL = initObj.FRI_CTRL
      }
      else {
        this.FRI_CTRL = 0;
      }
      if (initObj.hasOwnProperty('ROBOT_CTRL_MODE')) {
        this.ROBOT_CTRL_MODE = initObj.ROBOT_CTRL_MODE
      }
      else {
        this.ROBOT_CTRL_MODE = 0;
      }
      if (initObj.hasOwnProperty('IsRobotArmPowerOn')) {
        this.IsRobotArmPowerOn = initObj.IsRobotArmPowerOn
      }
      else {
        this.IsRobotArmPowerOn = false;
      }
      if (initObj.hasOwnProperty('DoesAnyDriveSignalAnError')) {
        this.DoesAnyDriveSignalAnError = initObj.DoesAnyDriveSignalAnError
      }
      else {
        this.DoesAnyDriveSignalAnError = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FRI
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _arraySerializer.string(obj.name, buffer, bufferOffset, null);
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float64(obj.position, buffer, bufferOffset, null);
    // Serialize message field [effort]
    bufferOffset = _arraySerializer.float64(obj.effort, buffer, bufferOffset, null);
    // Serialize message field [stiffness]
    bufferOffset = _arraySerializer.float64(obj.stiffness, buffer, bufferOffset, null);
    // Serialize message field [damping]
    bufferOffset = _arraySerializer.float64(obj.damping, buffer, bufferOffset, null);
    // Serialize message field [FRI_STATE]
    bufferOffset = _serializer.int64(obj.FRI_STATE, buffer, bufferOffset);
    // Serialize message field [FRI_QUALITY]
    bufferOffset = _serializer.int64(obj.FRI_QUALITY, buffer, bufferOffset);
    // Serialize message field [FRI_CTRL]
    bufferOffset = _serializer.int64(obj.FRI_CTRL, buffer, bufferOffset);
    // Serialize message field [ROBOT_CTRL_MODE]
    bufferOffset = _serializer.int64(obj.ROBOT_CTRL_MODE, buffer, bufferOffset);
    // Serialize message field [IsRobotArmPowerOn]
    bufferOffset = _serializer.bool(obj.IsRobotArmPowerOn, buffer, bufferOffset);
    // Serialize message field [DoesAnyDriveSignalAnError]
    bufferOffset = _serializer.bool(obj.DoesAnyDriveSignalAnError, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FRI
    let len;
    let data = new FRI(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [effort]
    data.effort = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [stiffness]
    data.stiffness = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [damping]
    data.damping = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [FRI_STATE]
    data.FRI_STATE = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [FRI_QUALITY]
    data.FRI_QUALITY = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [FRI_CTRL]
    data.FRI_CTRL = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [ROBOT_CTRL_MODE]
    data.ROBOT_CTRL_MODE = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [IsRobotArmPowerOn]
    data.IsRobotArmPowerOn = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [DoesAnyDriveSignalAnError]
    data.DoesAnyDriveSignalAnError = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.name.forEach((val) => {
      length += 4 + val.length;
    });
    length += 8 * object.position.length;
    length += 8 * object.effort.length;
    length += 8 * object.stiffness.length;
    length += 8 * object.damping.length;
    return length + 54;
  }

  static datatype() {
    // Returns string type for a message object
    return 'lwr_fri/FRI';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1c34faf79d9377b5acf8f04748e1f1a2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    string[] name
    float64[] position
    float64[] effort
    float64[] stiffness
    float64[] damping
    int64 FRI_STATE
    int64 FRI_QUALITY
    int64 FRI_CTRL
    int64 ROBOT_CTRL_MODE
    bool IsRobotArmPowerOn
    bool DoesAnyDriveSignalAnError
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FRI(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = []
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = []
    }

    if (msg.effort !== undefined) {
      resolved.effort = msg.effort;
    }
    else {
      resolved.effort = []
    }

    if (msg.stiffness !== undefined) {
      resolved.stiffness = msg.stiffness;
    }
    else {
      resolved.stiffness = []
    }

    if (msg.damping !== undefined) {
      resolved.damping = msg.damping;
    }
    else {
      resolved.damping = []
    }

    if (msg.FRI_STATE !== undefined) {
      resolved.FRI_STATE = msg.FRI_STATE;
    }
    else {
      resolved.FRI_STATE = 0
    }

    if (msg.FRI_QUALITY !== undefined) {
      resolved.FRI_QUALITY = msg.FRI_QUALITY;
    }
    else {
      resolved.FRI_QUALITY = 0
    }

    if (msg.FRI_CTRL !== undefined) {
      resolved.FRI_CTRL = msg.FRI_CTRL;
    }
    else {
      resolved.FRI_CTRL = 0
    }

    if (msg.ROBOT_CTRL_MODE !== undefined) {
      resolved.ROBOT_CTRL_MODE = msg.ROBOT_CTRL_MODE;
    }
    else {
      resolved.ROBOT_CTRL_MODE = 0
    }

    if (msg.IsRobotArmPowerOn !== undefined) {
      resolved.IsRobotArmPowerOn = msg.IsRobotArmPowerOn;
    }
    else {
      resolved.IsRobotArmPowerOn = false
    }

    if (msg.DoesAnyDriveSignalAnError !== undefined) {
      resolved.DoesAnyDriveSignalAnError = msg.DoesAnyDriveSignalAnError;
    }
    else {
      resolved.DoesAnyDriveSignalAnError = false
    }

    return resolved;
    }
};

module.exports = FRI;
