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
include src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/depend.make

# Include the progress variables for this target.
include src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/progress.make

# Include the compile flags for this target's objects.
include src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/flags.make

src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o: src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/flags.make
src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o: /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/examples/unsorted-examples/quick_start.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/unsorted-examples && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example-quick-start.dir/quick_start.cxx.o -c /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/examples/unsorted-examples/quick_start.cxx

src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example-quick-start.dir/quick_start.cxx.i"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/unsorted-examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/examples/unsorted-examples/quick_start.cxx > CMakeFiles/example-quick-start.dir/quick_start.cxx.i

src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example-quick-start.dir/quick_start.cxx.s"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/unsorted-examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/examples/unsorted-examples/quick_start.cxx -o CMakeFiles/example-quick-start.dir/quick_start.cxx.s

src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o.requires:

.PHONY : src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o.requires

src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o.provides: src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o.requires
	$(MAKE) -f src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/build.make src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o.provides.build
.PHONY : src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o.provides

src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o.provides.build: src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o


# Object files for target example-quick-start
example__quick__start_OBJECTS = \
"CMakeFiles/example-quick-start.dir/quick_start.cxx.o"

# External object files for target example-quick-start
example__quick__start_EXTERNAL_OBJECTS =

src/examples/unsorted-examples/example-quick-start: src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o
src/examples/unsorted-examples/example-quick-start: src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/build.make
src/examples/unsorted-examples/example-quick-start: src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable example-quick-start"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/unsorted-examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example-quick-start.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/build: src/examples/unsorted-examples/example-quick-start

.PHONY : src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/build

src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/requires: src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/quick_start.cxx.o.requires

.PHONY : src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/requires

src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/clean:
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/unsorted-examples && $(CMAKE_COMMAND) -P CMakeFiles/example-quick-start.dir/cmake_clean.cmake
.PHONY : src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/clean

src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/depend:
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/examples/unsorted-examples /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/unsorted-examples /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/examples/unsorted-examples/CMakeFiles/example-quick-start.dir/depend

