# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/catkin_ws/build

# Include any dependencies generated for this target.
include allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/depend.make

# Include the progress variables for this target.
include allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/progress.make

# Include the compile flags for this target's objects.
include allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/flags.make

allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o: allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/flags.make
allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o: /home/ubuntu/catkin_ws/src/allegro-hand-ros/allegro_hand_controllers/src/allegro_node_velsat.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o"
	cd /home/ubuntu/catkin_ws/build/allegro-hand-ros/allegro_hand_controllers && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o -c /home/ubuntu/catkin_ws/src/allegro-hand-ros/allegro_hand_controllers/src/allegro_node_velsat.cpp

allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.i"
	cd /home/ubuntu/catkin_ws/build/allegro-hand-ros/allegro_hand_controllers && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/catkin_ws/src/allegro-hand-ros/allegro_hand_controllers/src/allegro_node_velsat.cpp > CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.i

allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.s"
	cd /home/ubuntu/catkin_ws/build/allegro-hand-ros/allegro_hand_controllers && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/catkin_ws/src/allegro-hand-ros/allegro_hand_controllers/src/allegro_node_velsat.cpp -o CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.s

allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o.requires:

.PHONY : allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o.requires

allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o.provides: allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o.requires
	$(MAKE) -f allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/build.make allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o.provides.build
.PHONY : allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o.provides

allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o.provides.build: allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o


# Object files for target allegro_node_velsat
allegro_node_velsat_OBJECTS = \
"CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o"

# External object files for target allegro_node_velsat
allegro_node_velsat_EXTERNAL_OBJECTS =

/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/build.make
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /home/ubuntu/catkin_ws/devel/lib/liballegro_node.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /home/ubuntu/catkin_ws/devel/lib/liballegro_hand_driver.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /home/ubuntu/catkin_ws/devel/lib/libBHand.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /home/ubuntu/catkin_ws/devel/lib/libpcan.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /opt/ros/kinetic/lib/libroscpp.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /opt/ros/kinetic/lib/librosconsole.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /opt/ros/kinetic/lib/librostime.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /opt/ros/kinetic/lib/libcpp_common.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat: allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat"
	cd /home/ubuntu/catkin_ws/build/allegro-hand-ros/allegro_hand_controllers && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/allegro_node_velsat.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/build: /home/ubuntu/catkin_ws/devel/lib/allegro_hand_controllers/allegro_node_velsat

.PHONY : allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/build

allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/requires: allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/src/allegro_node_velsat.cpp.o.requires

.PHONY : allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/requires

allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/clean:
	cd /home/ubuntu/catkin_ws/build/allegro-hand-ros/allegro_hand_controllers && $(CMAKE_COMMAND) -P CMakeFiles/allegro_node_velsat.dir/cmake_clean.cmake
.PHONY : allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/clean

allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/depend:
	cd /home/ubuntu/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/catkin_ws/src /home/ubuntu/catkin_ws/src/allegro-hand-ros/allegro_hand_controllers /home/ubuntu/catkin_ws/build /home/ubuntu/catkin_ws/build/allegro-hand-ros/allegro_hand_controllers /home/ubuntu/catkin_ws/build/allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : allegro-hand-ros/allegro_hand_controllers/CMakeFiles/allegro_node_velsat.dir/depend

