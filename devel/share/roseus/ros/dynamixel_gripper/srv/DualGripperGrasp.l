;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_gripper::DualGripperGrasp)
  (if (not (find-package "DYNAMIXEL_GRIPPER"))
    (make-package "DYNAMIXEL_GRIPPER"))
  (shadow 'DualGripperGrasp (find-package "DYNAMIXEL_GRIPPER")))
(unless (find-package "DYNAMIXEL_GRIPPER::DUALGRIPPERGRASP")
  (make-package "DYNAMIXEL_GRIPPER::DUALGRIPPERGRASP"))
(unless (find-package "DYNAMIXEL_GRIPPER::DUALGRIPPERGRASPREQUEST")
  (make-package "DYNAMIXEL_GRIPPER::DUALGRIPPERGRASPREQUEST"))
(unless (find-package "DYNAMIXEL_GRIPPER::DUALGRIPPERGRASPRESPONSE")
  (make-package "DYNAMIXEL_GRIPPER::DUALGRIPPERGRASPRESPONSE"))

(in-package "ROS")





(defclass dynamixel_gripper::DualGripperGraspRequest
  :super ros::object
  :slots (_position ))

(defmethod dynamixel_gripper::DualGripperGraspRequest
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
    ;; float32 _position
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _position
       (sys::poke _position (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _position
     (setq _position (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass dynamixel_gripper::DualGripperGraspResponse
  :super ros::object
  :slots (_success ))

(defmethod dynamixel_gripper::DualGripperGraspResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass dynamixel_gripper::DualGripperGrasp
  :super ros::object
  :slots ())

(setf (get dynamixel_gripper::DualGripperGrasp :md5sum-) "f335b9ea2f9d5dd5fcf3d9c70616d213")
(setf (get dynamixel_gripper::DualGripperGrasp :datatype-) "dynamixel_gripper/DualGripperGrasp")
(setf (get dynamixel_gripper::DualGripperGrasp :request) dynamixel_gripper::DualGripperGraspRequest)
(setf (get dynamixel_gripper::DualGripperGrasp :response) dynamixel_gripper::DualGripperGraspResponse)

(defmethod dynamixel_gripper::DualGripperGraspRequest
  (:response () (instance dynamixel_gripper::DualGripperGraspResponse :init)))

(setf (get dynamixel_gripper::DualGripperGraspRequest :md5sum-) "f335b9ea2f9d5dd5fcf3d9c70616d213")
(setf (get dynamixel_gripper::DualGripperGraspRequest :datatype-) "dynamixel_gripper/DualGripperGraspRequest")
(setf (get dynamixel_gripper::DualGripperGraspRequest :definition-)
      "float32 position
---
bool success

")

(setf (get dynamixel_gripper::DualGripperGraspResponse :md5sum-) "f335b9ea2f9d5dd5fcf3d9c70616d213")
(setf (get dynamixel_gripper::DualGripperGraspResponse :datatype-) "dynamixel_gripper/DualGripperGraspResponse")
(setf (get dynamixel_gripper::DualGripperGraspResponse :definition-)
      "float32 position
---
bool success

")



(provide :dynamixel_gripper/DualGripperGrasp "f335b9ea2f9d5dd5fcf3d9c70616d213")


