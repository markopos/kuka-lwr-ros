; Auto-generated. Do not edit!


(cl:in-package dynamixel_gripper-srv)


;//! \htmlinclude SingleGripperGrasp-request.msg.html

(cl:defclass <SingleGripperGrasp-request> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0))
)

(cl:defclass SingleGripperGrasp-request (<SingleGripperGrasp-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SingleGripperGrasp-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SingleGripperGrasp-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_gripper-srv:<SingleGripperGrasp-request> is deprecated: use dynamixel_gripper-srv:SingleGripperGrasp-request instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <SingleGripperGrasp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_gripper-srv:position-val is deprecated.  Use dynamixel_gripper-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SingleGripperGrasp-request>) ostream)
  "Serializes a message object of type '<SingleGripperGrasp-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SingleGripperGrasp-request>) istream)
  "Deserializes a message object of type '<SingleGripperGrasp-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SingleGripperGrasp-request>)))
  "Returns string type for a service object of type '<SingleGripperGrasp-request>"
  "dynamixel_gripper/SingleGripperGraspRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SingleGripperGrasp-request)))
  "Returns string type for a service object of type 'SingleGripperGrasp-request"
  "dynamixel_gripper/SingleGripperGraspRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SingleGripperGrasp-request>)))
  "Returns md5sum for a message object of type '<SingleGripperGrasp-request>"
  "f335b9ea2f9d5dd5fcf3d9c70616d213")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SingleGripperGrasp-request)))
  "Returns md5sum for a message object of type 'SingleGripperGrasp-request"
  "f335b9ea2f9d5dd5fcf3d9c70616d213")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SingleGripperGrasp-request>)))
  "Returns full string definition for message of type '<SingleGripperGrasp-request>"
  (cl:format cl:nil "float32 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SingleGripperGrasp-request)))
  "Returns full string definition for message of type 'SingleGripperGrasp-request"
  (cl:format cl:nil "float32 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SingleGripperGrasp-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SingleGripperGrasp-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SingleGripperGrasp-request
    (cl:cons ':position (position msg))
))
;//! \htmlinclude SingleGripperGrasp-response.msg.html

(cl:defclass <SingleGripperGrasp-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SingleGripperGrasp-response (<SingleGripperGrasp-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SingleGripperGrasp-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SingleGripperGrasp-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_gripper-srv:<SingleGripperGrasp-response> is deprecated: use dynamixel_gripper-srv:SingleGripperGrasp-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SingleGripperGrasp-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_gripper-srv:success-val is deprecated.  Use dynamixel_gripper-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SingleGripperGrasp-response>) ostream)
  "Serializes a message object of type '<SingleGripperGrasp-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SingleGripperGrasp-response>) istream)
  "Deserializes a message object of type '<SingleGripperGrasp-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SingleGripperGrasp-response>)))
  "Returns string type for a service object of type '<SingleGripperGrasp-response>"
  "dynamixel_gripper/SingleGripperGraspResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SingleGripperGrasp-response)))
  "Returns string type for a service object of type 'SingleGripperGrasp-response"
  "dynamixel_gripper/SingleGripperGraspResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SingleGripperGrasp-response>)))
  "Returns md5sum for a message object of type '<SingleGripperGrasp-response>"
  "f335b9ea2f9d5dd5fcf3d9c70616d213")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SingleGripperGrasp-response)))
  "Returns md5sum for a message object of type 'SingleGripperGrasp-response"
  "f335b9ea2f9d5dd5fcf3d9c70616d213")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SingleGripperGrasp-response>)))
  "Returns full string definition for message of type '<SingleGripperGrasp-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SingleGripperGrasp-response)))
  "Returns full string definition for message of type 'SingleGripperGrasp-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SingleGripperGrasp-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SingleGripperGrasp-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SingleGripperGrasp-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SingleGripperGrasp)))
  'SingleGripperGrasp-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SingleGripperGrasp)))
  'SingleGripperGrasp-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SingleGripperGrasp)))
  "Returns string type for a service object of type '<SingleGripperGrasp>"
  "dynamixel_gripper/SingleGripperGrasp")