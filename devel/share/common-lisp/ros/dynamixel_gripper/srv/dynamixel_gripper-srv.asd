
(cl:in-package :asdf)

(defsystem "dynamixel_gripper-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DualGripperGrasp" :depends-on ("_package_DualGripperGrasp"))
    (:file "_package_DualGripperGrasp" :depends-on ("_package"))
    (:file "GripperClose" :depends-on ("_package_GripperClose"))
    (:file "_package_GripperClose" :depends-on ("_package"))
    (:file "GripperOpen" :depends-on ("_package_GripperOpen"))
    (:file "_package_GripperOpen" :depends-on ("_package"))
    (:file "SingleGripperGrasp" :depends-on ("_package_SingleGripperGrasp"))
    (:file "_package_SingleGripperGrasp" :depends-on ("_package"))
  ))