; Auto-generated. Do not edit!


(cl:in-package dynamixel_gripper-srv)


;//! \htmlinclude GripperClose-request.msg.html

(cl:defclass <GripperClose-request> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0))
)

(cl:defclass GripperClose-request (<GripperClose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperClose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperClose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_gripper-srv:<GripperClose-request> is deprecated: use dynamixel_gripper-srv:GripperClose-request instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <GripperClose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_gripper-srv:position-val is deprecated.  Use dynamixel_gripper-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperClose-request>) ostream)
  "Serializes a message object of type '<GripperClose-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperClose-request>) istream)
  "Deserializes a message object of type '<GripperClose-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperClose-request>)))
  "Returns string type for a service object of type '<GripperClose-request>"
  "dynamixel_gripper/GripperCloseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperClose-request)))
  "Returns string type for a service object of type 'GripperClose-request"
  "dynamixel_gripper/GripperCloseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperClose-request>)))
  "Returns md5sum for a message object of type '<GripperClose-request>"
  "bb1d916c0cb02d122a8698fce1017916")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperClose-request)))
  "Returns md5sum for a message object of type 'GripperClose-request"
  "bb1d916c0cb02d122a8698fce1017916")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperClose-request>)))
  "Returns full string definition for message of type '<GripperClose-request>"
  (cl:format cl:nil "float64 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperClose-request)))
  "Returns full string definition for message of type 'GripperClose-request"
  (cl:format cl:nil "float64 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperClose-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperClose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperClose-request
    (cl:cons ':position (position msg))
))
;//! \htmlinclude GripperClose-response.msg.html

(cl:defclass <GripperClose-response> (roslisp-msg-protocol:ros-message)
  ((goal_reached
    :reader goal_reached
    :initarg :goal_reached
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GripperClose-response (<GripperClose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperClose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperClose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_gripper-srv:<GripperClose-response> is deprecated: use dynamixel_gripper-srv:GripperClose-response instead.")))

(cl:ensure-generic-function 'goal_reached-val :lambda-list '(m))
(cl:defmethod goal_reached-val ((m <GripperClose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_gripper-srv:goal_reached-val is deprecated.  Use dynamixel_gripper-srv:goal_reached instead.")
  (goal_reached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperClose-response>) ostream)
  "Serializes a message object of type '<GripperClose-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'goal_reached) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperClose-response>) istream)
  "Deserializes a message object of type '<GripperClose-response>"
    (cl:setf (cl:slot-value msg 'goal_reached) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperClose-response>)))
  "Returns string type for a service object of type '<GripperClose-response>"
  "dynamixel_gripper/GripperCloseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperClose-response)))
  "Returns string type for a service object of type 'GripperClose-response"
  "dynamixel_gripper/GripperCloseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperClose-response>)))
  "Returns md5sum for a message object of type '<GripperClose-response>"
  "bb1d916c0cb02d122a8698fce1017916")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperClose-response)))
  "Returns md5sum for a message object of type 'GripperClose-response"
  "bb1d916c0cb02d122a8698fce1017916")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperClose-response>)))
  "Returns full string definition for message of type '<GripperClose-response>"
  (cl:format cl:nil "bool goal_reached~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperClose-response)))
  "Returns full string definition for message of type 'GripperClose-response"
  (cl:format cl:nil "bool goal_reached~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperClose-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperClose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperClose-response
    (cl:cons ':goal_reached (goal_reached msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GripperClose)))
  'GripperClose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GripperClose)))
  'GripperClose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperClose)))
  "Returns string type for a service object of type '<GripperClose>"
  "dynamixel_gripper/GripperClose")