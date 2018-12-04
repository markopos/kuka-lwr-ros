if("a10695fad32ba8315817c42020e2dbc66f4505dd" STREQUAL "")
  message(FATAL_ERROR "Tag for git checkout should not be empty.")
endif()

set(run 0)

if("/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary-stamp/FRILibrary-gitinfo.txt" IS_NEWER_THAN "/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary-stamp/FRILibrary-gitclone-lastrun.txt")
  set(run 1)
endif()

if(NOT run)
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary-stamp/FRILibrary-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary'")
endif()

# try the clone 3 times incase there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git" clone --origin "origin" "https://github.com/iocroblab/fril.git" "FRILibrary"
    WORKING_DIRECTORY "/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/iocroblab/fril.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git" checkout a10695fad32ba8315817c42020e2dbc66f4505dd
  WORKING_DIRECTORY "/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'a10695fad32ba8315817c42020e2dbc66f4505dd'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule init 
  WORKING_DIRECTORY "/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to init submodules in: '/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule update --recursive 
  WORKING_DIRECTORY "/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary-stamp/FRILibrary-gitinfo.txt"
    "/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary-stamp/FRILibrary-gitclone-lastrun.txt"
  WORKING_DIRECTORY "/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/robotlab/catkin_ws/build/kuka-lwr-ros/kuka_lwr/lwr_hw/FRILibrary-prefix/src/FRILibrary-stamp/FRILibrary-gitclone-lastrun.txt'")
endif()

