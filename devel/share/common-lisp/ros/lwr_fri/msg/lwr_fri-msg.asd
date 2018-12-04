
(cl:in-package :asdf)

(defsystem "lwr_fri-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "FRI" :depends-on ("_package_FRI"))
    (:file "_package_FRI" :depends-on ("_package"))
    (:file "JointStates" :depends-on ("_package_JointStates"))
    (:file "_package_JointStates" :depends-on ("_package"))
  ))