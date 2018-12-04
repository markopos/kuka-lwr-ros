
(cl:in-package :asdf)

(defsystem "vtec_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "TrackingResult" :depends-on ("_package_TrackingResult"))
    (:file "_package_TrackingResult" :depends-on ("_package"))
  ))