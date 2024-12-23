TARGET_EXEC ?= nuquake.elf

BUILD_DIR ?= ./build_dc
EXEC_DIR ?= $(BUILD_DIR)
SRC_DIRS ?= ./src
ROOT_DIR := .
DEP_DIR := $(ROOT_DIR)/deps

FILTER_PLATFORMS = ./src/win32/% ./src/linux/% ./src/null/% ./src/common/unused/% ./src/client/unused/% ./src/dreamcast/unused/%

SRCS := $(filter-out $(FILTER_PLATFORMS), $(shell find $(SRC_DIRS) -name "*.c"))
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(filter-out $(FILTER_PLATFORMS), $(shell find $(SRC_DIRS) -type d))
INC_FLAGS := $(addprefix -I,$(INC_DIRS)) -Iinclude

# -fno-trapping-math -fno-finite-math-only
#BASE_CFLAGS =  -Wall -Wextra -Wformat=0 -Wstack-usage=8096 -Wcast-align -fdump-rtl-dfinish -fstack-usage -Wno-missing-field-initializers -Wno-missing-braces -Wdouble-promotion -Wstrict-aliasing -fstrict-aliasing -fsingle-precision-constant -Xlinker -Map=dreamcast.map -DGLQUAKE -DBUILD_LIBGL -std=gnu11 -fdiagnostics-color
BASE_DEFINES = -DENABLE_DC_MATH
#-DENABLE_DC_MATH
BASE_CFLAGS =  $(BASE_DEFINES) -Wall -Wextra -Wformat=0 -Wstack-usage=8096 -Wno-cast-align -Wno-missing-field-initializers -Wno-missing-braces -Wdouble-promotion -Wstrict-aliasing -fstrict-aliasing -fsingle-precision-constant -Xlinker -Map=dreamcast.map -DGLQUAKE -DBUILD_LIBGL -std=gnu11 -fdiagnostics-color
EXTRA_CFLAGS = -ffast-math -mdiv=inv -maccumulate-outgoing-args -mpretend-cmove -Wl,--gc-sections
RELEASE_CFLAGS = $(BASE_CFLAGS) $(INC_FLAGS) $(EXTRA_CFLAGS) -O3 -DQUIET -DNDEBUG
DEBUG_CFLAGS = $(BASE_CFLAGS) $(INC_FLAGS) -Og -fno-omit-frame-pointer -DFRAME_POINTERS
#-fstack-protector-all -finstrument-functions

all: debug

release: CFLAGS = $(RELEASE_CFLAGS)
debug: TARGET_EXEC = nuquake.elf
debug: CFLAGS = $(DEBUG_CFLAGS)

release: $(BUILD_DIR)/$(TARGET_EXEC)

debug: $(BUILD_DIR)/$(TARGET_EXEC)

#INC_LZO = -I$(DEP_DIR)/minilzo
#INC_ALDC = -I$(DEP_DIR)/aldc/include
INCS :=  -I$(DEP_DIR)/libgl/include  -I$(DEP_DIR)/cglm/include -I$(DEP_DIR)/SDL/include
#-I$(DEP_DIR)/SDL-1.2.9/inst/include


CC = kos-cc
AS = kos-as

STRIP = $(PREFIX)strip

LIB_GLDC = $(DEP_DIR)/libgl/libGLdc.a
LIB_LZO = $(DEP_DIR)/minilzo/libminilzo.a
#LIB_ALDC = $(DEP_DIR)/aldc/libAL.a
#LIB_SDL = -lSDL
#LIB_SDL = $(DEP_DIR)/SDL-1.2.9/libSDL_129.a
LIB_SDL = $(DEP_DIR)/SDL/libSDL.a

LIBS = $(LIB_GLDC)  -lz $(LIB_SDL)
INCS += -iquote src/common -iquote src/dreamcast

CPPFLAGS ?= $(INC_FLAGS) -MMD -MP

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS) $(LIB_GLDC)
	@echo -e "\n+ $@"
	@$(CC) $(CFLAGS) $(INCS) $(LDFLAGS) -o $@  $(OBJS) -L$(KOS_BASE)/lib $(LIBS) -lm $(KOS_LIBS)
	@$(KOS_CC_BASE)/sh-elf/bin/objcopy -R .stack -O binary $@ $(basename $@)
	@$(KOS_BASE)/utils/scramble/scramble $(basename $@) $(BUILD_DIR)/1ST_READ.BIN

$(BUILD_DIR)/%.s.o: %.s
	@echo  "! $@"
	@$(MKDIR_P) $(dir $@)
	@$(AS) $(ASFLAGS) -c $< -o $@

$(BUILD_DIR)/%.c.o: %.c
	@echo  "> $@"
	@$(MKDIR_P) $(dir $@)
	@$(CC) $(CFLAGS) $(INCS) -c $< -o $@

#GLdc :
#	@$(MAKE) -C deps/libgl CFLAGS=-DBUILD_LIBGL build

$(LIB_GLDC):
	$(MAKE) -C deps/libgl

$(LIB_LZO):
	$(MAKE) -C deps/minilzo

.PHONY: clean

clean:
	$(RM) -r $(BUILD_DIR)/src


.PHONY: build

build: $(BUILD_DIR)/$(TARGET_EXEC)

-include $(DEPS)

MKDIR_P ?= mkdir -p

CP_N ?= cp -u
#CP_N ?= cp -n
