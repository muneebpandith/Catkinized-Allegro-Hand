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

# Utility rule file for EP_libpcan.

# Include the progress variables for this target.
include cob_extern/libpcan/CMakeFiles/EP_libpcan.dir/progress.make

cob_extern/libpcan/CMakeFiles/EP_libpcan: cob_extern/libpcan/CMakeFiles/EP_libpcan-complete


cob_extern/libpcan/CMakeFiles/EP_libpcan-complete: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-install
cob_extern/libpcan/CMakeFiles/EP_libpcan-complete: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-mkdir
cob_extern/libpcan/CMakeFiles/EP_libpcan-complete: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-download
cob_extern/libpcan/CMakeFiles/EP_libpcan-complete: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-update
cob_extern/libpcan/CMakeFiles/EP_libpcan-complete: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-patch
cob_extern/libpcan/CMakeFiles/EP_libpcan-complete: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-configure
cob_extern/libpcan/CMakeFiles/EP_libpcan-complete: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-build
cob_extern/libpcan/CMakeFiles/EP_libpcan-complete: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'EP_libpcan'"
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build/cob_extern/libpcan/CMakeFiles
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build/cob_extern/libpcan/CMakeFiles/EP_libpcan-complete
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-done

cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-install: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No install step for 'EP_libpcan'"
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && /usr/bin/cmake -E echo_append
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-install

cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'EP_libpcan'"
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/tmp
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E make_directory /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-mkdir

cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-download: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-urlinfo.txt
cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-download: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (download, verify and extract) for 'EP_libpcan'"
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -P /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/download-EP_libpcan.cmake
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -P /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/verify-EP_libpcan.cmake
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -P /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/extract-EP_libpcan.cmake
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-download

cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-update: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'EP_libpcan'"
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E echo_append
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-update

cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-patch: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Performing patch step for 'EP_libpcan'"
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && sed -i "/#include <pcan.h>/c\\#include \"pcan.h\"" /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src/lib/libpcan.h
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-patch

cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-configure: cob_extern/libpcan/EP_libpcan-prefix/tmp/EP_libpcan-cfgcmd.txt
cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-configure: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-update
cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-configure: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No configure step for 'EP_libpcan'"
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && /usr/bin/cmake -E echo_append
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-configure

cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-build: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'EP_libpcan'"
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && make -C lib libpcan.so.0.6
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && /usr/bin/cmake -E copy_if_different /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src/lib/libpcan.h /home/ubuntu/catkin_ws/devel/include/libpcan
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && /usr/bin/cmake -E copy_if_different /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src/driver/pcan.h /home/ubuntu/catkin_ws/devel/include/libpcan
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && /usr/bin/cmake -E copy_if_different /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src/lib/libpcan.so.0.6 /home/ubuntu/catkin_ws/devel/lib
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && /usr/bin/cmake -E create_symlink libpcan.so.0 /home/ubuntu/catkin_ws/devel/lib/libpcan.so
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && /usr/bin/cmake -E create_symlink libpcan.so.0.6 /home/ubuntu/catkin_ws/devel/lib/libpcan.so.0
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan/libpcan-src && /usr/bin/cmake -E touch /home/ubuntu/catkin_ws/build/cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-build

EP_libpcan: cob_extern/libpcan/CMakeFiles/EP_libpcan
EP_libpcan: cob_extern/libpcan/CMakeFiles/EP_libpcan-complete
EP_libpcan: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-install
EP_libpcan: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-mkdir
EP_libpcan: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-download
EP_libpcan: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-update
EP_libpcan: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-patch
EP_libpcan: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-configure
EP_libpcan: cob_extern/libpcan/EP_libpcan-prefix/src/EP_libpcan-stamp/EP_libpcan-build
EP_libpcan: cob_extern/libpcan/CMakeFiles/EP_libpcan.dir/build.make

.PHONY : EP_libpcan

# Rule to build all files generated by this target.
cob_extern/libpcan/CMakeFiles/EP_libpcan.dir/build: EP_libpcan

.PHONY : cob_extern/libpcan/CMakeFiles/EP_libpcan.dir/build

cob_extern/libpcan/CMakeFiles/EP_libpcan.dir/clean:
	cd /home/ubuntu/catkin_ws/build/cob_extern/libpcan && $(CMAKE_COMMAND) -P CMakeFiles/EP_libpcan.dir/cmake_clean.cmake
.PHONY : cob_extern/libpcan/CMakeFiles/EP_libpcan.dir/clean

cob_extern/libpcan/CMakeFiles/EP_libpcan.dir/depend:
	cd /home/ubuntu/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/catkin_ws/src /home/ubuntu/catkin_ws/src/cob_extern/libpcan /home/ubuntu/catkin_ws/build /home/ubuntu/catkin_ws/build/cob_extern/libpcan /home/ubuntu/catkin_ws/build/cob_extern/libpcan/CMakeFiles/EP_libpcan.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : cob_extern/libpcan/CMakeFiles/EP_libpcan.dir/depend

