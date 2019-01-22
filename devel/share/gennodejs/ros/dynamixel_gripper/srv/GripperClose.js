// Auto-generated. Do not edit!

// (in-package dynamixel_gripper.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GripperCloseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position = null;
    }
    else {
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GripperCloseRequest
    // Serialize message field [position]
    bufferOffset = _serializer.float64(obj.position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GripperCloseRequest
    let len;
    let data = new GripperCloseRequest(null);
    // Deserialize message field [position]
    data.position = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dynamixel_gripper/GripperCloseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '81d629500ad53a56e7ab2ad1949abc81';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 position
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GripperCloseRequest(null);
    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = 0.0
    }

    return resolved;
    }
};

class GripperCloseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal_reached = null;
    }
    else {
      if (initObj.hasOwnProperty('goal_reached')) {
        this.goal_reached = initObj.goal_reached
      }
      else {
        this.goal_reached = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GripperCloseResponse
    // Serialize message field [goal_reached]
    bufferOffset = _serializer.bool(obj.goal_reached, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GripperCloseResponse
    let len;
    let data = new GripperCloseResponse(null);
    // Deserialize message field [goal_reached]
    data.goal_reached = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dynamixel_gripper/GripperCloseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a65bc774d2139031955fd7cc94fdd40f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool goal_reached
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GripperCloseResponse(null);
    if (msg.goal_reached !== undefined) {
      resolved.goal_reached = msg.goal_reached;
    }
    else {
      resolved.goal_reached = false
    }

    return resolved;
    }
};

module.exports = {
  Request: GripperCloseRequest,
  Response: GripperCloseResponse,
  md5sum() { return 'bb1d916c0cb02d122a8698fce1017916'; },
  datatype() { return 'dynamixel_gripper/GripperClose'; }
};
