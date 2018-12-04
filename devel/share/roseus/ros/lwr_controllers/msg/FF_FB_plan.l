;; Auto-generated. Do not edit!


(when (boundp 'lwr_controllers::FF_FB_plan)
  (if (not (find-package "LWR_CONTROLLERS"))
    (make-package "LWR_CONTROLLERS"))
  (shadow 'FF_FB_plan (find-package "LWR_CONTROLLERS")))
(unless (find-package "LWR_CONTROLLERS::FF_FB_PLAN")
  (make-package "LWR_CONTROLLERS::FF_FB_PLAN"))

(in-package "ROS")
;;//! \htmlinclude FF_FB_plan.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass lwr_controllers::FF_FB_plan
  :super ros::object
  :slots (_times _ff _xd _xd_dot _fb ))

(defmethod lwr_controllers::FF_FB_plan
  (:init
   (&key
    ((:times __times) (let (r) (dotimes (i 0) (push (instance std_msgs::Time :init) r)) r))
    ((:ff __ff) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Wrench :init) r)) r))
    ((:xd __xd) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Pose :init) r)) r))
    ((:xd_dot __xd_dot) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Twist :init) r)) r))
    ((:fb __fb) (let (r) (dotimes (i 0) (push (instance std_msgs::Float64MultiArray :init) r)) r))
    )
   (send-super :init)
   (setq _times __times)
   (setq _ff __ff)
   (setq _xd __xd)
   (setq _xd_dot __xd_dot)
   (setq _fb __fb)
   self)
  (:times
   (&rest __times)
   (if (keywordp (car __times))
       (send* _times __times)
     (progn
       (if __times (setq _times (car __times)))
       _times)))
  (:ff
   (&rest __ff)
   (if (keywordp (car __ff))
       (send* _ff __ff)
     (progn
       (if __ff (setq _ff (car __ff)))
       _ff)))
  (:xd
   (&rest __xd)
   (if (keywordp (car __xd))
       (send* _xd __xd)
     (progn
       (if __xd (setq _xd (car __xd)))
       _xd)))
  (:xd_dot
   (&rest __xd_dot)
   (if (keywordp (car __xd_dot))
       (send* _xd_dot __xd_dot)
     (progn
       (if __xd_dot (setq _xd_dot (car __xd_dot)))
       _xd_dot)))
  (:fb
   (&rest __fb)
   (if (keywordp (car __fb))
       (send* _fb __fb)
     (progn
       (if __fb (setq _fb (car __fb)))
       _fb)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Time[] _times
    (apply #'+ (send-all _times :serialization-length)) 4
    ;; geometry_msgs/Wrench[] _ff
    (apply #'+ (send-all _ff :serialization-length)) 4
    ;; geometry_msgs/Pose[] _xd
    (apply #'+ (send-all _xd :serialization-length)) 4
    ;; geometry_msgs/Twist[] _xd_dot
    (apply #'+ (send-all _xd_dot :serialization-length)) 4
    ;; std_msgs/Float64MultiArray[] _fb
    (apply #'+ (send-all _fb :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Time[] _times
     (write-long (length _times) s)
     (dolist (elem _times)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Wrench[] _ff
     (write-long (length _ff) s)
     (dolist (elem _ff)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Pose[] _xd
     (write-long (length _xd) s)
     (dolist (elem _xd)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Twist[] _xd_dot
     (write-long (length _xd_dot) s)
     (dolist (elem _xd_dot)
       (send elem :serialize s)
       )
     ;; std_msgs/Float64MultiArray[] _fb
     (write-long (length _fb) s)
     (dolist (elem _fb)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Time[] _times
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _times (let (r) (dotimes (i n) (push (instance std_msgs::Time :init) r)) r))
     (dolist (elem- _times)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Wrench[] _ff
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ff (let (r) (dotimes (i n) (push (instance geometry_msgs::Wrench :init) r)) r))
     (dolist (elem- _ff)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Pose[] _xd
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _xd (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _xd)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Twist[] _xd_dot
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _xd_dot (let (r) (dotimes (i n) (push (instance geometry_msgs::Twist :init) r)) r))
     (dolist (elem- _xd_dot)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/Float64MultiArray[] _fb
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _fb (let (r) (dotimes (i n) (push (instance std_msgs::Float64MultiArray :init) r)) r))
     (dolist (elem- _fb)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get lwr_controllers::FF_FB_plan :md5sum-) "a96cb59a5005197cccc1498c4103c512")
(setf (get lwr_controllers::FF_FB_plan :datatype-) "lwr_controllers/FF_FB_plan")
(setf (get lwr_controllers::FF_FB_plan :definition-)
      "std_msgs/Time[] times
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
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
uint32 stride  # stride of given dimension
")



(provide :lwr_controllers/FF_FB_plan "a96cb59a5005197cccc1498c4103c512")


