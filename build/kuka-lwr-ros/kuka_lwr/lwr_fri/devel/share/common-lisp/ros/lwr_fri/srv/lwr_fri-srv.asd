
(cl:in-package :asdf)

(defsystem "lwr_fri-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "StringService" :depends-on ("_package_StringService"))
    (:file "_package_StringService" :depends-on ("_package"))
  ))