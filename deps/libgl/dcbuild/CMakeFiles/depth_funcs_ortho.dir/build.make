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

# Include any dependencies generated for this target.
include CMakeFiles/depth_funcs_ortho.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/depth_funcs_ortho.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/depth_funcs_ortho.dir/flags.make

CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.obj: CMakeFiles/depth_funcs_ortho.dir/flags.make
CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.obj: ../samples/depth_funcs_ortho/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dreamdev/projects/kos/libraries/GLdc/dcbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.obj"
	/opt/toolchains/dc/sh-elf/bin/sh-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.obj   -c /home/dreamdev/projects/kos/libraries/GLdc/samples/depth_funcs_ortho/main.c

CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.i"
	/opt/toolchains/dc/sh-elf/bin/sh-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/dreamdev/projects/kos/libraries/GLdc/samples/depth_funcs_ortho/main.c > CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.i

CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.s"
	/opt/toolchains/dc/sh-elf/bin/sh-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/dreamdev/projects/kos/libraries/GLdc/samples/depth_funcs_ortho/main.c -o CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.s

# Object files for target depth_funcs_ortho
depth_funcs_ortho_OBJECTS = \
"CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.obj"

# External object files for target depth_funcs_ortho
depth_funcs_ortho_EXTERNAL_OBJECTS =

depth_funcs_ortho.elf: CMakeFiles/depth_funcs_ortho.dir/samples/depth_funcs_ortho/main.c.obj
depth_funcs_ortho.elf: CMakeFiles/depth_funcs_ortho.dir/build.make
depth_funcs_ortho.elf: libGLdc.a
depth_funcs_ortho.elf: ../samples/depth_funcs_ortho/romdisk.o
depth_funcs_ortho.elf: CMakeFiles/depth_funcs_ortho.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dreamdev/projects/kos/libraries/GLdc/dcbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable depth_funcs_ortho.elf"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/depth_funcs_ortho.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/depth_funcs_ortho.dir/build: depth_funcs_ortho.elf

.PHONY : CMakeFiles/depth_funcs_ortho.dir/build

CMakeFiles/depth_funcs_ortho.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/depth_funcs_ortho.dir/cmake_clean.cmake
.PHONY : CMakeFiles/depth_funcs_ortho.dir/clean

CMakeFiles/depth_funcs_ortho.dir/depend:
	cd /home/dreamdev/projects/kos/libraries/GLdc/dcbuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dreamdev/projects/kos/libraries/GLdc /home/dreamdev/projects/kos/libraries/GLdc /home/dreamdev/projects/kos/libraries/GLdc/dcbuild /home/dreamdev/projects/kos/libraries/GLdc/dcbuild /home/dreamdev/projects/kos/libraries/GLdc/dcbuild/CMakeFiles/depth_funcs_ortho.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/depth_funcs_ortho.dir/depend

