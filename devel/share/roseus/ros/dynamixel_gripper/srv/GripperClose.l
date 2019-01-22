;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_gripper::GripperClose)
  (if (not (find-package "DYNAMIXEL_GRIPPER"))
    (make-package "DYNAMIXEL_GRIPPER"))
  (shadow 'GripperClose (find-package "DYNAMIXEL_GRIPPER")))
(unless (find-package "DYNAMIXEL_GRIPPER::GRIPPERCLOSE")
  (make-package "DYNAMIXEL_GRIPPER::GRIPPERCLOSE"))
(unless (find-package "DYNAMIXEL_GRIPPER::GRIPPERCLOSEREQUEST")
  (make-package "DYNAMIXEL_GRIPPER::GRIPPERCLOSEREQUEST"))
(unless (find-package "DYNAMIXEL_GRIPPER::GRIPPERCLOSERESPONSE")
  (make-package "DYNAMIXEL_GRIPPER::GRIPPERCLOSERESPONSE"))

(in-package "ROS")





(defclass dynamixel_gripper::GripperCloseRequest
  :super ros::object
  :slots (_position ))

(defmethod dynamixel_gripper::GripperCloseRequest
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

(defclass dynamixel_gripper::GripperCloseResponse
  :super ros::object
  :slots (_goal_reached ))

(defmethod dynamixel_gripper::GripperCloseResponse
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

(defclass dynamixel_gripper::GripperClose
  :super ros::object
  :slots ())

(setf (get dynamixel_gripper::GripperClose :md5sum-) "bb1d916c0cb02d122a8698fce1017916")
(setf (get dynamixel_gripper::GripperClose :datatype-) "dynamixel_gripper/GripperClose")
(setf (get dynamixel_gripper::GripperClose :request) dynamixel_gripper::GripperCloseRequest)
(setf (get dynamixel_gripper::GripperClose :response) dynamixel_gripper::GripperCloseResponse)

(defmethod dynamixel_gripper::GripperCloseRequest
  (:response () (instance dynamixel_gripper::GripperCloseResponse :init)))

(setf (get dynamixel_gripper::GripperCloseRequest :md5sum-) "bb1d916c0cb02d122a8698fce1017916")
(setf (get dynamixel_gripper::GripperCloseRequest :datatype-) "dynamixel_gripper/GripperCloseRequest")
(setf (get dynamixel_gripper::GripperCloseRequest :definition-)
      "float64 position
---
bool goal_reached
")

(setf (get dynamixel_gripper::GripperCloseResponse :md5sum-) "bb1d916c0cb02d122a8698fce1017916")
(setf (get dynamixel_gripper::GripperCloseResponse :datatype-) "dynamixel_gripper/GripperCloseResponse")
(setf (get dynamixel_gripper::GripperCloseResponse :definition-)
      "float64 position
---
bool goal_reached
")



(provide :dynamixel_gripper/GripperClose "bb1d916c0cb02d122a8698fce1017916")


