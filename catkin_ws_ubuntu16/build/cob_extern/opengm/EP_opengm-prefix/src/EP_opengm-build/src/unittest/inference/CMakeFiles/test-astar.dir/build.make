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
CMAKE_SOURCE_DIR = /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build

# Include any dependencies generated for this target.
include src/unittest/inference/CMakeFiles/test-astar.dir/depend.make

# Include the progress variables for this target.
include src/unittest/inference/CMakeFiles/test-astar.dir/progress.make

# Include the compile flags for this target's objects.
include src/unittest/inference/CMakeFiles/test-astar.dir/flags.make

src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o: src/unittest/inference/CMakeFiles/test-astar.dir/flags.make
src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o: /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/unittest/inference/test_astar.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/unittest/inference && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test-astar.dir/test_astar.cxx.o -c /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/unittest/inference/test_astar.cxx

src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-astar.dir/test_astar.cxx.i"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/unittest/inference && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/unittest/inference/test_astar.cxx > CMakeFiles/test-astar.dir/test_astar.cxx.i

src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-astar.dir/test_astar.cxx.s"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/unittest/inference && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/unittest/inference/test_astar.cxx -o CMakeFiles/test-astar.dir/test_astar.cxx.s

src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o.requires:

.PHONY : src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o.requires

src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o.provides: src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o.requires
	$(MAKE) -f src/unittest/inference/CMakeFiles/test-astar.dir/build.make src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o.provides.build
.PHONY : src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o.provides

src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o.provides.build: src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o


# Object files for target test-astar
test__astar_OBJECTS = \
"CMakeFiles/test-astar.dir/test_astar.cxx.o"

# External object files for target test-astar
test__astar_EXTERNAL_OBJECTS =

src/unittest/inference/test-astar: src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o
src/unittest/inference/test-astar: src/unittest/inference/CMakeFiles/test-astar.dir/build.make
src/unittest/inference/test-astar: src/unittest/inference/CMakeFiles/test-astar.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test-astar"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/unittest/inference && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-astar.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/unittest/inference/CMakeFiles/test-astar.dir/build: src/unittest/inference/test-astar

.PHONY : src/unittest/inference/CMakeFiles/test-astar.dir/build

src/unittest/inference/CMakeFiles/test-astar.dir/requires: src/unittest/inference/CMakeFiles/test-astar.dir/test_astar.cxx.o.requires

.PHONY : src/unittest/inference/CMakeFiles/test-astar.dir/requires

src/unittest/inference/CMakeFiles/test-astar.dir/clean:
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/unittest/inference && $(CMAKE_COMMAND) -P CMakeFiles/test-astar.dir/cmake_clean.cmake
.PHONY : src/unittest/inference/CMakeFiles/test-astar.dir/clean

src/unittest/inference/CMakeFiles/test-astar.dir/depend:
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/unittest/inference /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/unittest/inference /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/unittest/inference/CMakeFiles/test-astar.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/unittest/inference/CMakeFiles/test-astar.dir/depend

