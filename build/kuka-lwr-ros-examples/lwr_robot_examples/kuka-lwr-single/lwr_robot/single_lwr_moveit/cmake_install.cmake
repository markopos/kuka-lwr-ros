# Install script for directory: /home/robotlab/catkin_ws/src/kuka-lwr-ros-examples/lwr_robot_examples/kuka-lwr-single/lwr_robot/single_lwr_moveit

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/robotlab/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/robotlab/catkin_ws/build/kuka-lwr-ros-examples/lwr_robot_examples/kuka-lwr-single/lwr_robot/single_lwr_moveit/catkin_generated/installspace/single_lwr_moveit.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/single_lwr_moveit/cmake" TYPE FILE FILES
    "/home/robotlab/catkin_ws/build/kuka-lwr-ros-examples/lwr_robot_examples/kuka-lwr-single/lwr_robot/single_lwr_moveit/catkin_generated/installspace/single_lwr_moveitConfig.cmake"
    "/home/robotlab/catkin_ws/build/kuka-lwr-ros-examples/lwr_robot_examples/kuka-lwr-single/lwr_robot/single_lwr_moveit/catkin_generated/installspace/single_lwr_moveitConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/single_lwr_moveit" TYPE FILE FILES "/home/robotlab/catkin_ws/src/kuka-lwr-ros-examples/lwr_robot_examples/kuka-lwr-single/lwr_robot/single_lwr_moveit/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/single_lwr_moveit" TYPE DIRECTORY FILES "/home/robotlab/catkin_ws/src/kuka-lwr-ros-examples/lwr_robot_examples/kuka-lwr-single/lwr_robot/single_lwr_moveit/launch")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/single_lwr_moveit" TYPE DIRECTORY FILES "/home/robotlab/catkin_ws/src/kuka-lwr-ros-examples/lwr_robot_examples/kuka-lwr-single/lwr_robot/single_lwr_moveit/config")
endif()

