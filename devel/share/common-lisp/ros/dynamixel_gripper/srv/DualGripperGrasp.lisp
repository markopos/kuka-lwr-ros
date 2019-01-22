; Auto-generated. Do not edit!


(cl:in-package dynamixel_gripper-srv)


;//! \htmlinclude DualGripperGrasp-request.msg.html

(cl:defclass <DualGripperGrasp-request> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0))
)

(cl:defclass DualGripperGrasp-request (<DualGripperGrasp-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DualGripperGrasp-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DualGripperGrasp-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_gripper-srv:<DualGripperGrasp-request> is deprecated: use dynamixel_gripper-srv:DualGripperGrasp-request instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <DualGripperGrasp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_gripper-srv:position-val is deprecated.  Use dynamixel_gripper-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DualGripperGrasp-request>) ostream)
  "Serializes a message object of type '<DualGripperGrasp-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DualGripperGrasp-request>) istream)
  "Deserializes a message object of type '<DualGripperGrasp-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DualGripperGrasp-request>)))
  "Returns string type for a service object of type '<DualGripperGrasp-request>"
  "dynamixel_gripper/DualGripperGraspRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DualGripperGrasp-request)))
  "Returns string type for a service object of type 'DualGripperGrasp-request"
  "dynamixel_gripper/DualGripperGraspRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DualGripperGrasp-request>)))
  "Returns md5sum for a message object of type '<DualGripperGrasp-request>"
  "f335b9ea2f9d5dd5fcf3d9c70616d213")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DualGripperGrasp-request)))
  "Returns md5sum for a message object of type 'DualGripperGrasp-request"
  "f335b9ea2f9d5dd5fcf3d9c70616d213")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DualGripperGrasp-request>)))
  "Returns full string definition for message of type '<DualGripperGrasp-request>"
  (cl:format cl:nil "float32 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DualGripperGrasp-request)))
  "Returns full string definition for message of type 'DualGripperGrasp-request"
  (cl:format cl:nil "float32 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DualGripperGrasp-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DualGripperGrasp-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DualGripperGrasp-request
    (cl:cons ':position (position msg))
))
;//! \htmlinclude DualGripperGrasp-response.msg.html

(cl:defclass <DualGripperGrasp-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DualGripperGrasp-response (<DualGripperGrasp-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DualGripperGrasp-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DualGripperGrasp-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_gripper-srv:<DualGripperGrasp-response> is deprecated: use dynamixel_gripper-srv:DualGripperGrasp-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <DualGripperGrasp-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_gripper-srv:success-val is deprecated.  Use dynamixel_gripper-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DualGripperGrasp-response>) ostream)
  "Serializes a message object of type '<DualGripperGrasp-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DualGripperGrasp-response>) istream)
  "Deserializes a message object of type '<DualGripperGrasp-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DualGripperGrasp-response>)))
  "Returns string type for a service object of type '<DualGripperGrasp-response>"
  "dynamixel_gripper/DualGripperGraspResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DualGripperGrasp-response)))
  "Returns string type for a service object of type 'DualGripperGrasp-response"
  "dynamixel_gripper/DualGripperGraspResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DualGripperGrasp-response>)))
  "Returns md5sum for a message object of type '<DualGripperGrasp-response>"
  "f335b9ea2f9d5dd5fcf3d9c70616d213")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DualGripperGrasp-response)))
  "Returns md5sum for a message object of type 'DualGripperGrasp-response"
  "f335b9ea2f9d5dd5fcf3d9c70616d213")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DualGripperGrasp-response>)))
  "Returns full string definition for message of type '<DualGripperGrasp-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DualGripperGrasp-response)))
  "Returns full string definition for message of type 'DualGripperGrasp-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DualGripperGrasp-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DualGripperGrasp-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DualGripperGrasp-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DualGripperGrasp)))
  'DualGripperGrasp-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DualGripperGrasp)))
  'DualGripperGrasp-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DualGripperGrasp)))
  "Returns string type for a service object of type '<DualGripperGrasp>"
  "dynamixel_gripper/DualGripperGrasp")