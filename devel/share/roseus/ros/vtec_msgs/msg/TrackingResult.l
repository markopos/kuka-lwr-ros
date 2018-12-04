;; Auto-generated. Do not edit!


(when (boundp 'vtec_msgs::TrackingResult)
  (if (not (find-package "VTEC_MSGS"))
    (make-package "VTEC_MSGS"))
  (shadow 'TrackingResult (find-package "VTEC_MSGS")))
(unless (find-package "VTEC_MSGS::TRACKINGRESULT")
  (make-package "VTEC_MSGS::TRACKINGRESULT"))

(in-package "ROS")
;;//! \htmlinclude TrackingResult.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass vtec_msgs::TrackingResult
  :super ros::object
  :slots (_header _score _homography _alpha _beta _corners ))

(defmethod vtec_msgs::TrackingResult
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:score __score) 0.0)
    ((:homography __homography) (make-array 9 :initial-element 0.0 :element-type :float))
    ((:alpha __alpha) 0.0)
    ((:beta __beta) 0.0)
    ((:corners __corners) (let (r) (dotimes (i 4) (push (instance geometry_msgs::Point :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _score (float __score))
   (setq _homography __homography)
   (setq _alpha (float __alpha))
   (setq _beta (float __beta))
   (setq _corners __corners)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:homography
   (&optional __homography)
   (if __homography (setq _homography __homography)) _homography)
  (:alpha
   (&optional __alpha)
   (if __alpha (setq _alpha __alpha)) _alpha)
  (:beta
   (&optional __beta)
   (if __beta (setq _beta __beta)) _beta)
  (:corners
   (&rest __corners)
   (if (keywordp (car __corners))
       (send* _corners __corners)
     (progn
       (if __corners (setq _corners (car __corners)))
       _corners)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _score
    8
    ;; float32[9] _homography
    (* 4    9)
    ;; float32 _alpha
    4
    ;; float32 _beta
    4
    ;; geometry_msgs/Point[4] _corners
    (apply #'+ (send-all _corners :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _score
       (sys::poke _score (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32[9] _homography
     (dotimes (i 9)
       (sys::poke (elt _homography i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _alpha
       (sys::poke _alpha (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _beta
       (sys::poke _beta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Point[4] _corners
     (dolist (elem _corners)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _score
     (setq _score (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32[9] _homography
   (dotimes (i (length _homography))
     (setf (elt _homography i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _alpha
     (setq _alpha (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _beta
     (setq _beta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Point[4] _corners
   (dotimes (i 4)
     (send (elt _corners i) :deserialize buf ptr-) (incf ptr- (send (elt _corners i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get vtec_msgs::TrackingResult :md5sum-) "7102c9ac7d706a3777e6c6a896f18cf7")
(setf (get vtec_msgs::TrackingResult :datatype-) "vtec_msgs/TrackingResult")
(setf (get vtec_msgs::TrackingResult :definition-)
      "Header header
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

")



(provide :vtec_msgs/TrackingResult "7102c9ac7d706a3777e6c6a896f18cf7")


