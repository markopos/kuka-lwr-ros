# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "lwr_controllers: 4 messages, 0 services")

set(MSG_I_FLAGS "-Ilwr_controllers:/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lwr_controllers_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg" NAME_WE)
add_custom_target(_lwr_controllers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lwr_controllers" "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg" "std_msgs/MultiArrayDimension:geometry_msgs/Twist:std_msgs/MultiArrayLayout:geometry_msgs/Quaternion:geometry_msgs/Wrench:geometry_msgs/Point:geometry_msgs/Vector3:std_msgs/Time:std_msgs/Float64MultiArray:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg" NAME_WE)
add_custom_target(_lwr_controllers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lwr_controllers" "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg" "lwr_controllers/RPY:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg" NAME_WE)
add_custom_target(_lwr_controllers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lwr_controllers" "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg" ""
)

get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg" NAME_WE)
add_custom_target(_lwr_controllers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lwr_controllers" "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Time.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lwr_controllers
)
_generate_msg_cpp(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lwr_controllers
)
_generate_msg_cpp(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg"
  "${MSG_I_FLAGS}"
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lwr_controllers
)
_generate_msg_cpp(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lwr_controllers
)

### Generating Services

### Generating Module File
_generate_module_cpp(lwr_controllers
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lwr_controllers
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lwr_controllers_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lwr_controllers_generate_messages lwr_controllers_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_cpp _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_cpp _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_cpp _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_cpp _lwr_controllers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lwr_controllers_gencpp)
add_dependencies(lwr_controllers_gencpp lwr_controllers_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lwr_controllers_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Time.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lwr_controllers
)
_generate_msg_eus(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lwr_controllers
)
_generate_msg_eus(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg"
  "${MSG_I_FLAGS}"
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lwr_controllers
)
_generate_msg_eus(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lwr_controllers
)

### Generating Services

### Generating Module File
_generate_module_eus(lwr_controllers
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lwr_controllers
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(lwr_controllers_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(lwr_controllers_generate_messages lwr_controllers_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_eus _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_eus _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_eus _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_eus _lwr_controllers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lwr_controllers_geneus)
add_dependencies(lwr_controllers_geneus lwr_controllers_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lwr_controllers_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Time.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lwr_controllers
)
_generate_msg_lisp(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lwr_controllers
)
_generate_msg_lisp(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg"
  "${MSG_I_FLAGS}"
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lwr_controllers
)
_generate_msg_lisp(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lwr_controllers
)

### Generating Services

### Generating Module File
_generate_module_lisp(lwr_controllers
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lwr_controllers
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lwr_controllers_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lwr_controllers_generate_messages lwr_controllers_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_lisp _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_lisp _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_lisp _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_lisp _lwr_controllers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lwr_controllers_genlisp)
add_dependencies(lwr_controllers_genlisp lwr_controllers_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lwr_controllers_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Time.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lwr_controllers
)
_generate_msg_nodejs(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lwr_controllers
)
_generate_msg_nodejs(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg"
  "${MSG_I_FLAGS}"
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lwr_controllers
)
_generate_msg_nodejs(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lwr_controllers
)

### Generating Services

### Generating Module File
_generate_module_nodejs(lwr_controllers
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lwr_controllers
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(lwr_controllers_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(lwr_controllers_generate_messages lwr_controllers_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_nodejs _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_nodejs _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_nodejs _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_nodejs _lwr_controllers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lwr_controllers_gennodejs)
add_dependencies(lwr_controllers_gennodejs lwr_controllers_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lwr_controllers_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Wrench.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Time.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Float64MultiArray.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lwr_controllers
)
_generate_msg_py(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lwr_controllers
)
_generate_msg_py(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg"
  "${MSG_I_FLAGS}"
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lwr_controllers
)
_generate_msg_py(lwr_controllers
  "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lwr_controllers
)

### Generating Services

### Generating Module File
_generate_module_py(lwr_controllers
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lwr_controllers
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lwr_controllers_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lwr_controllers_generate_messages lwr_controllers_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/FF_FB_plan.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_py _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/PoseRPY.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_py _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/MultiPriorityTask.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_py _lwr_controllers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robotlab/catkin_ws/src/kuka-lwr-ros/kuka_lwr/lwr_controllers/msg/RPY.msg" NAME_WE)
add_dependencies(lwr_controllers_generate_messages_py _lwr_controllers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lwr_controllers_genpy)
add_dependencies(lwr_controllers_genpy lwr_controllers_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lwr_controllers_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lwr_controllers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lwr_controllers
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(lwr_controllers_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(lwr_controllers_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lwr_controllers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lwr_controllers
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(lwr_controllers_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(lwr_controllers_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lwr_controllers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lwr_controllers
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(lwr_controllers_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(lwr_controllers_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lwr_controllers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lwr_controllers
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(lwr_controllers_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(lwr_controllers_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lwr_controllers)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lwr_controllers\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lwr_controllers
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(lwr_controllers_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(lwr_controllers_generate_messages_py geometry_msgs_generate_messages_py)
endif()
