;; Auto-generated. Do not edit!


(when (boundp 'lwr_ros_client::String_cmd)
  (if (not (find-package "LWR_ROS_CLIENT"))
    (make-package "LWR_ROS_CLIENT"))
  (shadow 'String_cmd (find-package "LWR_ROS_CLIENT")))
(unless (find-package "LWR_ROS_CLIENT::STRING_CMD")
  (make-package "LWR_ROS_CLIENT::STRING_CMD"))
(unless (find-package "LWR_ROS_CLIENT::STRING_CMDREQUEST")
  (make-package "LWR_ROS_CLIENT::STRING_CMDREQUEST"))
(unless (find-package "LWR_ROS_CLIENT::STRING_CMDRESPONSE")
  (make-package "LWR_ROS_CLIENT::STRING_CMDRESPONSE"))

(in-package "ROS")





(defclass lwr_ros_client::String_cmdRequest
  :super ros::object
  :slots (_cmd ))

(defmethod lwr_ros_client::String_cmdRequest
  (:init
   (&key
    ((:cmd __cmd) "")
    )
   (send-super :init)
   (setq _cmd (string __cmd))
   self)
  (:cmd
   (&optional __cmd)
   (if __cmd (setq _cmd __cmd)) _cmd)
  (:serialization-length
   ()
   (+
    ;; string _cmd
    4 (length _cmd)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _cmd
       (write-long (length _cmd) s) (princ _cmd s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _cmd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cmd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass lwr_ros_client::String_cmdResponse
  :super ros::object
  :slots (_res ))

(defmethod lwr_ros_client::String_cmdResponse
  (:init
   (&key
    ((:res __res) "")
    )
   (send-super :init)
   (setq _res (string __res))
   self)
  (:res
   (&optional __res)
   (if __res (setq _res __res)) _res)
  (:serialization-length
   ()
   (+
    ;; string _res
    4 (length _res)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _res
       (write-long (length _res) s) (princ _res s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _res
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _res (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass lwr_ros_client::String_cmd
  :super ros::object
  :slots ())

(setf (get lwr_ros_client::String_cmd :md5sum-) "d4463b49bd5bb77dbd8c4356f5dc1c28")
(setf (get lwr_ros_client::String_cmd :datatype-) "lwr_ros_client/String_cmd")
(setf (get lwr_ros_client::String_cmd :request) lwr_ros_client::String_cmdRequest)
(setf (get lwr_ros_client::String_cmd :response) lwr_ros_client::String_cmdResponse)

(defmethod lwr_ros_client::String_cmdRequest
  (:response () (instance lwr_ros_client::String_cmdResponse :init)))

(setf (get lwr_ros_client::String_cmdRequest :md5sum-) "d4463b49bd5bb77dbd8c4356f5dc1c28")
(setf (get lwr_ros_client::String_cmdRequest :datatype-) "lwr_ros_client/String_cmdRequest")
(setf (get lwr_ros_client::String_cmdRequest :definition-)
      "string cmd
---
string res

")

(setf (get lwr_ros_client::String_cmdResponse :md5sum-) "d4463b49bd5bb77dbd8c4356f5dc1c28")
(setf (get lwr_ros_client::String_cmdResponse :datatype-) "lwr_ros_client/String_cmdResponse")
(setf (get lwr_ros_client::String_cmdResponse :definition-)
      "string cmd
---
string res

")



(provide :lwr_ros_client/String_cmd "d4463b49bd5bb77dbd8c4356f5dc1c28")


