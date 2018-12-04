;; Auto-generated. Do not edit!


(when (boundp 'lwr_fri::FRI)
  (if (not (find-package "LWR_FRI"))
    (make-package "LWR_FRI"))
  (shadow 'FRI (find-package "LWR_FRI")))
(unless (find-package "LWR_FRI::FRI")
  (make-package "LWR_FRI::FRI"))

(in-package "ROS")
;;//! \htmlinclude FRI.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass lwr_fri::FRI
  :super ros::object
  :slots (_header _name _position _effort _stiffness _damping _FRI_STATE _FRI_QUALITY _FRI_CTRL _ROBOT_CTRL_MODE _IsRobotArmPowerOn _DoesAnyDriveSignalAnError ))

(defmethod lwr_fri::FRI
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:name __name) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:effort __effort) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:stiffness __stiffness) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:damping __damping) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:FRI_STATE __FRI_STATE) 0)
    ((:FRI_QUALITY __FRI_QUALITY) 0)
    ((:FRI_CTRL __FRI_CTRL) 0)
    ((:ROBOT_CTRL_MODE __ROBOT_CTRL_MODE) 0)
    ((:IsRobotArmPowerOn __IsRobotArmPowerOn) nil)
    ((:DoesAnyDriveSignalAnError __DoesAnyDriveSignalAnError) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _name __name)
   (setq _position __position)
   (setq _effort __effort)
   (setq _stiffness __stiffness)
   (setq _damping __damping)
   (setq _FRI_STATE (round __FRI_STATE))
   (setq _FRI_QUALITY (round __FRI_QUALITY))
   (setq _FRI_CTRL (round __FRI_CTRL))
   (setq _ROBOT_CTRL_MODE (round __ROBOT_CTRL_MODE))
   (setq _IsRobotArmPowerOn __IsRobotArmPowerOn)
   (setq _DoesAnyDriveSignalAnError __DoesAnyDriveSignalAnError)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:effort
   (&optional __effort)
   (if __effort (setq _effort __effort)) _effort)
  (:stiffness
   (&optional __stiffness)
   (if __stiffness (setq _stiffness __stiffness)) _stiffness)
  (:damping
   (&optional __damping)
   (if __damping (setq _damping __damping)) _damping)
  (:FRI_STATE
   (&optional __FRI_STATE)
   (if __FRI_STATE (setq _FRI_STATE __FRI_STATE)) _FRI_STATE)
  (:FRI_QUALITY
   (&optional __FRI_QUALITY)
   (if __FRI_QUALITY (setq _FRI_QUALITY __FRI_QUALITY)) _FRI_QUALITY)
  (:FRI_CTRL
   (&optional __FRI_CTRL)
   (if __FRI_CTRL (setq _FRI_CTRL __FRI_CTRL)) _FRI_CTRL)
  (:ROBOT_CTRL_MODE
   (&optional __ROBOT_CTRL_MODE)
   (if __ROBOT_CTRL_MODE (setq _ROBOT_CTRL_MODE __ROBOT_CTRL_MODE)) _ROBOT_CTRL_MODE)
  (:IsRobotArmPowerOn
   (&optional __IsRobotArmPowerOn)
   (if __IsRobotArmPowerOn (setq _IsRobotArmPowerOn __IsRobotArmPowerOn)) _IsRobotArmPowerOn)
  (:DoesAnyDriveSignalAnError
   (&optional __DoesAnyDriveSignalAnError)
   (if __DoesAnyDriveSignalAnError (setq _DoesAnyDriveSignalAnError __DoesAnyDriveSignalAnError)) _DoesAnyDriveSignalAnError)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string[] _name
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _name)) 4
    ;; float64[] _position
    (* 8    (length _position)) 4
    ;; float64[] _effort
    (* 8    (length _effort)) 4
    ;; float64[] _stiffness
    (* 8    (length _stiffness)) 4
    ;; float64[] _damping
    (* 8    (length _damping)) 4
    ;; int64 _FRI_STATE
    8
    ;; int64 _FRI_QUALITY
    8
    ;; int64 _FRI_CTRL
    8
    ;; int64 _ROBOT_CTRL_MODE
    8
    ;; bool _IsRobotArmPowerOn
    1
    ;; bool _DoesAnyDriveSignalAnError
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string[] _name
     (write-long (length _name) s)
     (dolist (elem _name)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float64[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _effort
     (write-long (length _effort) s)
     (dotimes (i (length _effort))
       (sys::poke (elt _effort i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _stiffness
     (write-long (length _stiffness) s)
     (dotimes (i (length _stiffness))
       (sys::poke (elt _stiffness i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _damping
     (write-long (length _damping) s)
     (dotimes (i (length _damping))
       (sys::poke (elt _damping i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; int64 _FRI_STATE
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _FRI_STATE (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _FRI_STATE) (= (length (_FRI_STATE . bv)) 2)) ;; bignum
              (write-long (ash (elt (_FRI_STATE . bv) 0) 0) s)
              (write-long (ash (elt (_FRI_STATE . bv) 1) -1) s))
             ((and (class _FRI_STATE) (= (length (_FRI_STATE . bv)) 1)) ;; big1
              (write-long (elt (_FRI_STATE . bv) 0) s)
              (write-long (if (>= _FRI_STATE 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _FRI_STATE s)(write-long (if (>= _FRI_STATE 0) 0 #xffffffff) s)))
     ;; int64 _FRI_QUALITY
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _FRI_QUALITY (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _FRI_QUALITY) (= (length (_FRI_QUALITY . bv)) 2)) ;; bignum
              (write-long (ash (elt (_FRI_QUALITY . bv) 0) 0) s)
              (write-long (ash (elt (_FRI_QUALITY . bv) 1) -1) s))
             ((and (class _FRI_QUALITY) (= (length (_FRI_QUALITY . bv)) 1)) ;; big1
              (write-long (elt (_FRI_QUALITY . bv) 0) s)
              (write-long (if (>= _FRI_QUALITY 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _FRI_QUALITY s)(write-long (if (>= _FRI_QUALITY 0) 0 #xffffffff) s)))
     ;; int64 _FRI_CTRL
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _FRI_CTRL (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _FRI_CTRL) (= (length (_FRI_CTRL . bv)) 2)) ;; bignum
              (write-long (ash (elt (_FRI_CTRL . bv) 0) 0) s)
              (write-long (ash (elt (_FRI_CTRL . bv) 1) -1) s))
             ((and (class _FRI_CTRL) (= (length (_FRI_CTRL . bv)) 1)) ;; big1
              (write-long (elt (_FRI_CTRL . bv) 0) s)
              (write-long (if (>= _FRI_CTRL 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _FRI_CTRL s)(write-long (if (>= _FRI_CTRL 0) 0 #xffffffff) s)))
     ;; int64 _ROBOT_CTRL_MODE
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _ROBOT_CTRL_MODE (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _ROBOT_CTRL_MODE) (= (length (_ROBOT_CTRL_MODE . bv)) 2)) ;; bignum
              (write-long (ash (elt (_ROBOT_CTRL_MODE . bv) 0) 0) s)
              (write-long (ash (elt (_ROBOT_CTRL_MODE . bv) 1) -1) s))
             ((and (class _ROBOT_CTRL_MODE) (= (length (_ROBOT_CTRL_MODE . bv)) 1)) ;; big1
              (write-long (elt (_ROBOT_CTRL_MODE . bv) 0) s)
              (write-long (if (>= _ROBOT_CTRL_MODE 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _ROBOT_CTRL_MODE s)(write-long (if (>= _ROBOT_CTRL_MODE 0) 0 #xffffffff) s)))
     ;; bool _IsRobotArmPowerOn
       (if _IsRobotArmPowerOn (write-byte -1 s) (write-byte 0 s))
     ;; bool _DoesAnyDriveSignalAnError
       (if _DoesAnyDriveSignalAnError (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string[] _name
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _name (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _name i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float64[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _effort
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _effort (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _effort i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _stiffness
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _stiffness (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _stiffness i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _damping
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _damping (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _damping i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; int64 _FRI_STATE
#+(or :alpha :irix6 :x86_64)
      (setf _FRI_STATE (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _FRI_STATE (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _FRI_QUALITY
#+(or :alpha :irix6 :x86_64)
      (setf _FRI_QUALITY (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _FRI_QUALITY (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _FRI_CTRL
#+(or :alpha :irix6 :x86_64)
      (setf _FRI_CTRL (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _FRI_CTRL (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _ROBOT_CTRL_MODE
#+(or :alpha :irix6 :x86_64)
      (setf _ROBOT_CTRL_MODE (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _ROBOT_CTRL_MODE (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; bool _IsRobotArmPowerOn
     (setq _IsRobotArmPowerOn (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _DoesAnyDriveSignalAnError
     (setq _DoesAnyDriveSignalAnError (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get lwr_fri::FRI :md5sum-) "1c34faf79d9377b5acf8f04748e1f1a2")
(setf (get lwr_fri::FRI :datatype-) "lwr_fri/FRI")
(setf (get lwr_fri::FRI :definition-)
      "std_msgs/Header header
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

")



(provide :lwr_fri/FRI "1c34faf79d9377b5acf8f04748e1f1a2")


