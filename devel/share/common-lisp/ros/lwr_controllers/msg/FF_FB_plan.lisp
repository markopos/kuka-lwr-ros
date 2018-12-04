; Auto-generated. Do not edit!


(cl:in-package lwr_controllers-msg)


;//! \htmlinclude FF_FB_plan.msg.html

(cl:defclass <FF_FB_plan> (roslisp-msg-protocol:ros-message)
  ((times
    :reader times
    :initarg :times
    :type (cl:vector std_msgs-msg:Time)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:Time :initial-element (cl:make-instance 'std_msgs-msg:Time)))
   (ff
    :reader ff
    :initarg :ff
    :type (cl:vector geometry_msgs-msg:Wrench)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Wrench :initial-element (cl:make-instance 'geometry_msgs-msg:Wrench)))
   (xd
    :reader xd
    :initarg :xd
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose)))
   (xd_dot
    :reader xd_dot
    :initarg :xd_dot
    :type (cl:vector geometry_msgs-msg:Twist)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Twist :initial-element (cl:make-instance 'geometry_msgs-msg:Twist)))
   (fb
    :reader fb
    :initarg :fb
    :type (cl:vector std_msgs-msg:Float64MultiArray)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:Float64MultiArray :initial-element (cl:make-instance 'std_msgs-msg:Float64MultiArray))))
)

(cl:defclass FF_FB_plan (<FF_FB_plan>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FF_FB_plan>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FF_FB_plan)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lwr_controllers-msg:<FF_FB_plan> is deprecated: use lwr_controllers-msg:FF_FB_plan instead.")))

(cl:ensure-generic-function 'times-val :lambda-list '(m))
(cl:defmethod times-val ((m <FF_FB_plan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lwr_controllers-msg:times-val is deprecated.  Use lwr_controllers-msg:times instead.")
  (times m))

(cl:ensure-generic-function 'ff-val :lambda-list '(m))
(cl:defmethod ff-val ((m <FF_FB_plan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lwr_controllers-msg:ff-val is deprecated.  Use lwr_controllers-msg:ff instead.")
  (ff m))

(cl:ensure-generic-function 'xd-val :lambda-list '(m))
(cl:defmethod xd-val ((m <FF_FB_plan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lwr_controllers-msg:xd-val is deprecated.  Use lwr_controllers-msg:xd instead.")
  (xd m))

(cl:ensure-generic-function 'xd_dot-val :lambda-list '(m))
(cl:defmethod xd_dot-val ((m <FF_FB_plan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lwr_controllers-msg:xd_dot-val is deprecated.  Use lwr_controllers-msg:xd_dot instead.")
  (xd_dot m))

(cl:ensure-generic-function 'fb-val :lambda-list '(m))
(cl:defmethod fb-val ((m <FF_FB_plan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lwr_controllers-msg:fb-val is deprecated.  Use lwr_controllers-msg:fb instead.")
  (fb m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FF_FB_plan>) ostream)
  "Serializes a message object of type '<FF_FB_plan>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'times))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'times))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ff))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ff))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'xd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'xd))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'xd_dot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'xd_dot))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'fb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'fb))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FF_FB_plan>) istream)
  "Deserializes a message object of type '<FF_FB_plan>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'times) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'times)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:Time))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ff) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ff)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Wrench))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'xd) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'xd)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'xd_dot) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'xd_dot)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Twist))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'fb) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'fb)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:Float64MultiArray))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FF_FB_plan>)))
  "Returns string type for a message object of type '<FF_FB_plan>"
  "lwr_controllers/FF_FB_plan")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FF_FB_plan)))
  "Returns string type for a message object of type 'FF_FB_plan"
  "lwr_controllers/FF_FB_plan")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FF_FB_plan>)))
  "Returns md5sum for a message object of type '<FF_FB_plan>"
  "a96cb59a5005197cccc1498c4103c512")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FF_FB_plan)))
  "Returns md5sum for a message object of type 'FF_FB_plan"
  "a96cb59a5005197cccc1498c4103c512")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FF_FB_plan>)))
  "Returns full string definition for message of type '<FF_FB_plan>"
  (cl:format cl:nil "std_msgs/Time[] times~%geometry_msgs/Wrench[] ff~%geometry_msgs/Pose[] xd~%geometry_msgs/Twist[] xd_dot~%std_msgs/Float64MultiArray[] fb~%~%================================================================================~%MSG: std_msgs/Time~%time data~%~%================================================================================~%MSG: geometry_msgs/Wrench~%# This represents force in free space, separated into~%# its linear and angular parts.~%Vector3  force~%Vector3  torque~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: std_msgs/Float64MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float64[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FF_FB_plan)))
  "Returns full string definition for message of type 'FF_FB_plan"
  (cl:format cl:nil "std_msgs/Time[] times~%geometry_msgs/Wrench[] ff~%geometry_msgs/Pose[] xd~%geometry_msgs/Twist[] xd_dot~%std_msgs/Float64MultiArray[] fb~%~%================================================================================~%MSG: std_msgs/Time~%time data~%~%================================================================================~%MSG: geometry_msgs/Wrench~%# This represents force in free space, separated into~%# its linear and angular parts.~%Vector3  force~%Vector3  torque~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: std_msgs/Float64MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float64[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FF_FB_plan>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'times) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ff) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'xd) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'xd_dot) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'fb) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FF_FB_plan>))
  "Converts a ROS message object to a list"
  (cl:list 'FF_FB_plan
    (cl:cons ':times (times msg))
    (cl:cons ':ff (ff msg))
    (cl:cons ':xd (xd msg))
    (cl:cons ':xd_dot (xd_dot msg))
    (cl:cons ':fb (fb msg))
))
