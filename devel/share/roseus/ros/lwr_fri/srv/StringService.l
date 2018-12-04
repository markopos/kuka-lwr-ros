;; Auto-generated. Do not edit!


(when (boundp 'lwr_fri::StringService)
  (if (not (find-package "LWR_FRI"))
    (make-package "LWR_FRI"))
  (shadow 'StringService (find-package "LWR_FRI")))
(unless (find-package "LWR_FRI::STRINGSERVICE")
  (make-package "LWR_FRI::STRINGSERVICE"))
(unless (find-package "LWR_FRI::STRINGSERVICEREQUEST")
  (make-package "LWR_FRI::STRINGSERVICEREQUEST"))
(unless (find-package "LWR_FRI::STRINGSERVICERESPONSE")
  (make-package "LWR_FRI::STRINGSERVICERESPONSE"))

(in-package "ROS")





(defclass lwr_fri::StringServiceRequest
  :super ros::object
  :slots (_str ))

(defmethod lwr_fri::StringServiceRequest
  (:init
   (&key
    ((:str __str) "")
    )
   (send-super :init)
   (setq _str (string __str))
   self)
  (:str
   (&optional __str)
   (if __str (setq _str __str)) _str)
  (:serialization-length
   ()
   (+
    ;; string _str
    4 (length _str)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _str
       (write-long (length _str) s) (princ _str s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _str
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _str (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass lwr_fri::StringServiceResponse
  :super ros::object
  :slots (_str ))

(defmethod lwr_fri::StringServiceResponse
  (:init
   (&key
    ((:str __str) "")
    )
   (send-super :init)
   (setq _str (string __str))
   self)
  (:str
   (&optional __str)
   (if __str (setq _str __str)) _str)
  (:serialization-length
   ()
   (+
    ;; string _str
    4 (length _str)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _str
       (write-long (length _str) s) (princ _str s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _str
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _str (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass lwr_fri::StringService
  :super ros::object
  :slots ())

(setf (get lwr_fri::StringService :md5sum-) "671f8e4998eaec79f1c47e339dfd527b")
(setf (get lwr_fri::StringService :datatype-) "lwr_fri/StringService")
(setf (get lwr_fri::StringService :request) lwr_fri::StringServiceRequest)
(setf (get lwr_fri::StringService :response) lwr_fri::StringServiceResponse)

(defmethod lwr_fri::StringServiceRequest
  (:response () (instance lwr_fri::StringServiceResponse :init)))

(setf (get lwr_fri::StringServiceRequest :md5sum-) "671f8e4998eaec79f1c47e339dfd527b")
(setf (get lwr_fri::StringServiceRequest :datatype-) "lwr_fri/StringServiceRequest")
(setf (get lwr_fri::StringServiceRequest :definition-)
      "string str
---
string str

")

(setf (get lwr_fri::StringServiceResponse :md5sum-) "671f8e4998eaec79f1c47e339dfd527b")
(setf (get lwr_fri::StringServiceResponse :datatype-) "lwr_fri/StringServiceResponse")
(setf (get lwr_fri::StringServiceResponse :definition-)
      "string str
---
string str

")



(provide :lwr_fri/StringService "671f8e4998eaec79f1c47e339dfd527b")


