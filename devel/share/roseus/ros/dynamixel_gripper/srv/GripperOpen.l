;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_gripper::GripperOpen)
  (if (not (find-package "DYNAMIXEL_GRIPPER"))
    (make-package "DYNAMIXEL_GRIPPER"))
  (shadow 'GripperOpen (find-package "DYNAMIXEL_GRIPPER")))
(unless (find-package "DYNAMIXEL_GRIPPER::GRIPPEROPEN")
  (make-package "DYNAMIXEL_GRIPPER::GRIPPEROPEN"))
(unless (find-package "DYNAMIXEL_GRIPPER::GRIPPEROPENREQUEST")
  (make-package "DYNAMIXEL_GRIPPER::GRIPPEROPENREQUEST"))
(unless (find-package "DYNAMIXEL_GRIPPER::GRIPPEROPENRESPONSE")
  (make-package "DYNAMIXEL_GRIPPER::GRIPPEROPENRESPONSE"))

(in-package "ROS")





(defclass dynamixel_gripper::GripperOpenRequest
  :super ros::object
  :slots (_position ))

(defmethod dynamixel_gripper::GripperOpenRequest
  (:init
   (&key
    ((:position __position) 0.0)
    )
   (send-super :init)
   (setq _position (float __position))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; float64 _position
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _position
       (sys::poke _position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _position
     (setq _position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass dynamixel_gripper::GripperOpenResponse
  :super ros::object
  :slots (_goal_reached ))

(defmethod dynamixel_gripper::GripperOpenResponse
  (:init
   (&key
    ((:goal_reached __goal_reached) nil)
    )
   (send-super :init)
   (setq _goal_reached __goal_reached)
   self)
  (:goal_reached
   (&optional __goal_reached)
   (if __goal_reached (setq _goal_reached __goal_reached)) _goal_reached)
  (:serialization-length
   ()
   (+
    ;; bool _goal_reached
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _goal_reached
       (if _goal_reached (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _goal_reached
     (setq _goal_reached (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass dynamixel_gripper::GripperOpen
  :super ros::object
  :slots ())

(setf (get dynamixel_gripper::GripperOpen :md5sum-) "bb1d916c0cb02d122a8698fce1017916")
(setf (get dynamixel_gripper::GripperOpen :datatype-) "dynamixel_gripper/GripperOpen")
(setf (get dynamixel_gripper::GripperOpen :request) dynamixel_gripper::GripperOpenRequest)
(setf (get dynamixel_gripper::GripperOpen :response) dynamixel_gripper::GripperOpenResponse)

(defmethod dynamixel_gripper::GripperOpenRequest
  (:response () (instance dynamixel_gripper::GripperOpenResponse :init)))

(setf (get dynamixel_gripper::GripperOpenRequest :md5sum-) "bb1d916c0cb02d122a8698fce1017916")
(setf (get dynamixel_gripper::GripperOpenRequest :datatype-) "dynamixel_gripper/GripperOpenRequest")
(setf (get dynamixel_gripper::GripperOpenRequest :definition-)
      "float64 position
---
bool goal_reached
")

(setf (get dynamixel_gripper::GripperOpenResponse :md5sum-) "bb1d916c0cb02d122a8698fce1017916")
(setf (get dynamixel_gripper::GripperOpenResponse :datatype-) "dynamixel_gripper/GripperOpenResponse")
(setf (get dynamixel_gripper::GripperOpenResponse :definition-)
      "float64 position
---
bool goal_reached
")



(provide :dynamixel_gripper/GripperOpen "bb1d916c0cb02d122a8698fce1017916")


