# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/dreamdev/projects/kos/libraries/GLdc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dreamdev/projects/kos/libraries/GLdc/dcbuild

# Utility rule file for paletted_romdisk.

# Include the progress variables for this target.
include CMakeFiles/paletted_romdisk.dir/progress.make

CMakeFiles/paletted_romdisk: ../samples/paletted/romdisk.o


../samples/paletted/romdisk.o: ../samples/paletted/romdisk.img
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/dreamdev/projects/kos/libraries/GLdc/dcbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../samples/paletted/romdisk.o"
	cd /home/dreamdev/projects/kos/libraries/GLdc/samples/paletted && /home/dreamdev/projects/kos/kallistios/utils/bin2o/bin2o romdisk.img romdisk romdisk.o

../samples/paletted/romdisk.img:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/dreamdev/projects/kos/libraries/GLdc/dcbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating ../samples/paletted/romdisk.img"
	/home/dreamdev/projects/kos/kallistios/utils/genromfs/genromfs -f /home/dreamdev/projects/kos/libraries/GLdc/samples/paletted/romdisk.img -d /home/dreamdev/projects/kos/libraries/GLdc/samples/paletted/romdisk -v

paletted_romdisk: CMakeFiles/paletted_romdisk
paletted_romdisk: ../samples/paletted/romdisk.o
paletted_romdisk: ../samples/paletted/romdisk.img
paletted_romdisk: CMakeFiles/paletted_romdisk.dir/build.make

.PHONY : paletted_romdisk

# Rule to build all files generated by this target.
CMakeFiles/paletted_romdisk.dir/build: paletted_romdisk

.PHONY : CMakeFiles/paletted_romdisk.dir/build

CMakeFiles/paletted_romdisk.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/paletted_romdisk.dir/cmake_clean.cmake
.PHONY : CMakeFiles/paletted_romdisk.dir/clean

CMakeFiles/paletted_romdisk.dir/depend:
	cd /home/dreamdev/projects/kos/libraries/GLdc/dcbuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dreamdev/projects/kos/libraries/GLdc /home/dreamdev/projects/kos/libraries/GLdc /home/dreamdev/projects/kos/libraries/GLdc/dcbuild /home/dreamdev/projects/kos/libraries/GLdc/dcbuild /home/dreamdev/projects/kos/libraries/GLdc/dcbuild/CMakeFiles/paletted_romdisk.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/paletted_romdisk.dir/depend

