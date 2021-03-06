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
include src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/depend.make

# Include the progress variables for this target.
include src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/progress.make

# Include the compile flags for this target's objects.
include src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/flags.make

src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o: src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/flags.make
src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o: /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/examples/image-processing-examples/interpixel_boundary_segmentation.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/image-processing-examples && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o -c /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/examples/image-processing-examples/interpixel_boundary_segmentation.cxx

src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.i"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/image-processing-examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/examples/image-processing-examples/interpixel_boundary_segmentation.cxx > CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.i

src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.s"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/image-processing-examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/examples/image-processing-examples/interpixel_boundary_segmentation.cxx -o CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.s

src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o.requires:

.PHONY : src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o.requires

src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o.provides: src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o.requires
	$(MAKE) -f src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/build.make src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o.provides.build
.PHONY : src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o.provides

src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o.provides.build: src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o


# Object files for target example-segmentation
example__segmentation_OBJECTS = \
"CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o"

# External object files for target example-segmentation
example__segmentation_EXTERNAL_OBJECTS =

src/examples/image-processing-examples/example-segmentation: src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o
src/examples/image-processing-examples/example-segmentation: src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/build.make
src/examples/image-processing-examples/example-segmentation: src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable example-segmentation"
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/image-processing-examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example-segmentation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/build: src/examples/image-processing-examples/example-segmentation

.PHONY : src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/build

src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/requires: src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/interpixel_boundary_segmentation.cxx.o.requires

.PHONY : src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/requires

src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/clean:
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/image-processing-examples && $(CMAKE_COMMAND) -P CMakeFiles/example-segmentation.dir/cmake_clean.cmake
.PHONY : src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/clean

src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/depend:
	cd /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src /home/ubuntu/catkin_ws/build/cob_extern/opengm/opengm-src/src/examples/image-processing-examples /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/image-processing-examples /home/ubuntu/catkin_ws/build/cob_extern/opengm/EP_opengm-prefix/src/EP_opengm-build/src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/examples/image-processing-examples/CMakeFiles/example-segmentation.dir/depend

