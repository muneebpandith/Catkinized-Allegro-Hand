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
include src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/depend.make

# Include the progress variables for this target.
include src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/progress.make

# Include the compile flags for this target's objects.
include src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/flags.make

src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o: src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/flags.make
src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o: /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/tutorials/c++/basics/doMinSumInference.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/tutorials/c++/basics && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o -c /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/tutorials/c++/basics/doMinSumInference.cxx

src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.i"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/tutorials/c++/basics && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/tutorials/c++/basics/doMinSumInference.cxx > CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.i

src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.s"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/tutorials/c++/basics && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/tutorials/c++/basics/doMinSumInference.cxx -o CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.s

src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o.requires:

.PHONY : src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o.requires

src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o.provides: src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o.requires
	$(MAKE) -f src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/build.make src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o.provides.build
.PHONY : src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o.provides

src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o.provides.build: src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o


# Object files for target doMinSumInference
doMinSumInference_OBJECTS = \
"CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o"

# External object files for target doMinSumInference
doMinSumInference_EXTERNAL_OBJECTS =

src/tutorials/c++/basics/doMinSumInference: src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o
src/tutorials/c++/basics/doMinSumInference: src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/build.make
src/tutorials/c++/basics/doMinSumInference: src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable doMinSumInference"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/tutorials/c++/basics && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/doMinSumInference.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/build: src/tutorials/c++/basics/doMinSumInference

.PHONY : src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/build

src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/requires: src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/doMinSumInference.cxx.o.requires

.PHONY : src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/requires

src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/clean:
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/tutorials/c++/basics && $(CMAKE_COMMAND) -P CMakeFiles/doMinSumInference.dir/cmake_clean.cmake
.PHONY : src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/clean

src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/depend:
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/tutorials/c++/basics /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/tutorials/c++/basics /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tutorials/c++/basics/CMakeFiles/doMinSumInference.dir/depend

