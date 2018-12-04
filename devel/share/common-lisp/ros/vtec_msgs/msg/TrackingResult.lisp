; Auto-generated. Do not edit!


(cl:in-package vtec_msgs-msg)


;//! \htmlinclude TrackingResult.msg.html

(cl:defclass <TrackingResult> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (score
    :reader score
    :initarg :score
    :type cl:float
    :initform 0.0)
   (homography
    :reader homography
    :initarg :homography
    :type (cl:vector cl:float)
   :initform (cl:make-array 9 :element-type 'cl:float :initial-element 0.0))
   (alpha
    :reader alpha
    :initarg :alpha
    :type cl:float
    :initform 0.0)
   (beta
    :reader beta
    :initarg :beta
    :type cl:float
    :initform 0.0)
   (corners
    :reader corners
    :initarg :corners
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 4 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point))))
)

(cl:defclass TrackingResult (<TrackingResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrackingResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrackingResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vtec_msgs-msg:<TrackingResult> is deprecated: use vtec_msgs-msg:TrackingResult instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TrackingResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vtec_msgs-msg:header-val is deprecated.  Use vtec_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'score-val :lambda-list '(m))
(cl:defmethod score-val ((m <TrackingResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vtec_msgs-msg:score-val is deprecated.  Use vtec_msgs-msg:score instead.")
  (score m))

(cl:ensure-generic-function 'homography-val :lambda-list '(m))
(cl:defmethod homography-val ((m <TrackingResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vtec_msgs-msg:homography-val is deprecated.  Use vtec_msgs-msg:homography instead.")
  (homography m))

(cl:ensure-generic-function 'alpha-val :lambda-list '(m))
(cl:defmethod alpha-val ((m <TrackingResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vtec_msgs-msg:alpha-val is deprecated.  Use vtec_msgs-msg:alpha instead.")
  (alpha m))

(cl:ensure-generic-function 'beta-val :lambda-list '(m))
(cl:defmethod beta-val ((m <TrackingResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vtec_msgs-msg:beta-val is deprecated.  Use vtec_msgs-msg:beta instead.")
  (beta m))

(cl:ensure-generic-function 'corners-val :lambda-list '(m))
(cl:defmethod corners-val ((m <TrackingResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vtec_msgs-msg:corners-val is deprecated.  Use vtec_msgs-msg:corners instead.")
  (corners m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrackingResult>) ostream)
  "Serializes a message object of type '<TrackingResult>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'score))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'homography))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'alpha))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'beta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'corners))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrackingResult>) istream)
  "Deserializes a message object of type '<TrackingResult>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'score) (roslisp-utils:decode-double-float-bits bits)))
  (cl:setf (cl:slot-value msg 'homography) (cl:make-array 9))
  (cl:let ((vals (cl:slot-value msg 'homography)))
    (cl:dotimes (i 9)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'alpha) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'beta) (roslisp-utils:decode-single-float-bits bits)))
  (cl:setf (cl:slot-value msg 'corners) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'corners)))
    (cl:dotimes (i 4)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrackingResult>)))
  "Returns string type for a message object of type '<TrackingResult>"
  "vtec_msgs/TrackingResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrackingResult)))
  "Returns string type for a message object of type 'TrackingResult"
  "vtec_msgs/TrackingResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrackingResult>)))
  "Returns md5sum for a message object of type '<TrackingResult>"
  "7102c9ac7d706a3777e6c6a896f18cf7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrackingResult)))
  "Returns md5sum for a message object of type 'TrackingResult"
  "7102c9ac7d706a3777e6c6a896f18cf7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrackingResult>)))
  "Returns full string definition for message of type '<TrackingResult>"
  (cl:format cl:nil "Header header~%float64 score~%float32[9] homography~%float32 alpha~%float32 beta~%geometry_msgs/Point[4] corners~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrackingResult)))
  "Returns full string definition for message of type 'TrackingResult"
  (cl:format cl:nil "Header header~%float64 score~%float32[9] homography~%float32 alpha~%float32 beta~%geometry_msgs/Point[4] corners~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrackingResult>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'homography) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'corners) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrackingResult>))
  "Converts a ROS message object to a list"
  (cl:list 'TrackingResult
    (cl:cons ':header (header msg))
    (cl:cons ':score (score msg))
    (cl:cons ':homography (homography msg))
    (cl:cons ':alpha (alpha msg))
    (cl:cons ':beta (beta msg))
    (cl:cons ':corners (corners msg))
))
