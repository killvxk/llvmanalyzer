# Install script for directory: E:/git/WindowsResearch/retdec-master/deps

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/retdec")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("E:/git/WindowsResearch/retdec-master/deps/capstone/cmake_install.cmake")
  include("E:/git/WindowsResearch/retdec-master/deps/elfio/cmake_install.cmake")
  include("E:/git/WindowsResearch/retdec-master/deps/llvm/cmake_install.cmake")
  include("E:/git/WindowsResearch/retdec-master/deps/rapidjson/cmake_install.cmake")
  include("E:/git/WindowsResearch/retdec-master/deps/tinyxml2/cmake_install.cmake")
  include("E:/git/WindowsResearch/retdec-master/deps/yara/cmake_install.cmake")
  include("E:/git/WindowsResearch/retdec-master/deps/yaramod/cmake_install.cmake")

endif()
