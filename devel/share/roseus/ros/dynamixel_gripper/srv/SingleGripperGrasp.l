;; Auto-generated. Do not edit!


(when (boundp 'dynamixel_gripper::SingleGripperGrasp)
  (if (not (find-package "DYNAMIXEL_GRIPPER"))
    (make-package "DYNAMIXEL_GRIPPER"))
  (shadow 'SingleGripperGrasp (find-package "DYNAMIXEL_GRIPPER")))
(unless (find-package "DYNAMIXEL_GRIPPER::SINGLEGRIPPERGRASP")
  (make-package "DYNAMIXEL_GRIPPER::SINGLEGRIPPERGRASP"))
(unless (find-package "DYNAMIXEL_GRIPPER::SINGLEGRIPPERGRASPREQUEST")
  (make-package "DYNAMIXEL_GRIPPER::SINGLEGRIPPERGRASPREQUEST"))
(unless (find-package "DYNAMIXEL_GRIPPER::SINGLEGRIPPERGRASPRESPONSE")
  (make-package "DYNAMIXEL_GRIPPER::SINGLEGRIPPERGRASPRESPONSE"))

(in-package "ROS")





(defclass dynamixel_gripper::SingleGripperGraspRequest
  :super ros::object
  :slots (_position ))

(defmethod dynamixel_gripper::SingleGripperGraspRequest
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

(defclass dynamixel_gripper::SingleGripperGraspResponse
  :super ros::object
  :slots (_success ))

(defmethod dynamixel_gripper::SingleGripperGraspResponse
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

(defclass dynamixel_gripper::SingleGripperGrasp
  :super ros::object
  :slots ())

(setf (get dynamixel_gripper::SingleGripperGrasp :md5sum-) "f335b9ea2f9d5dd5fcf3d9c70616d213")
(setf (get dynamixel_gripper::SingleGripperGrasp :datatype-) "dynamixel_gripper/SingleGripperGrasp")
(setf (get dynamixel_gripper::SingleGripperGrasp :request) dynamixel_gripper::SingleGripperGraspRequest)
(setf (get dynamixel_gripper::SingleGripperGrasp :response) dynamixel_gripper::SingleGripperGraspResponse)

(defmethod dynamixel_gripper::SingleGripperGraspRequest
  (:response () (instance dynamixel_gripper::SingleGripperGraspResponse :init)))

(setf (get dynamixel_gripper::SingleGripperGraspRequest :md5sum-) "f335b9ea2f9d5dd5fcf3d9c70616d213")
(setf (get dynamixel_gripper::SingleGripperGraspRequest :datatype-) "dynamixel_gripper/SingleGripperGraspRequest")
(setf (get dynamixel_gripper::SingleGripperGraspRequest :definition-)
      "float32 position
---
bool success
")

(setf (get dynamixel_gripper::SingleGripperGraspResponse :md5sum-) "f335b9ea2f9d5dd5fcf3d9c70616d213")
(setf (get dynamixel_gripper::SingleGripperGraspResponse :datatype-) "dynamixel_gripper/SingleGripperGraspResponse")
(setf (get dynamixel_gripper::SingleGripperGraspResponse :definition-)
      "float32 position
---
bool success
")



(provide :dynamixel_gripper/SingleGripperGrasp "f335b9ea2f9d5dd5fcf3d9c70616d213")


