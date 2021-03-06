RPI3_BUILDROOT_DIR='buildroot-rpi3'
RPI3_START_DIR := $(shell pwd)
export RPI3_START_DIR

#Build dir arch->cpu->custom suffix
TEMP_BUILD_DIR := $(RPI3_START_DIR)/builds/build_rpi3
ifneq ($(strip $(BR2_GCC_TARGET_CPU)),)
	TEMP_BUILD_DIR += $(TEMP_BUILD_DIR)_$(BR2_GCC_TARGET_CPU)
endif

#remote whitespaces from build dir
space := $(nullstring) # end of the line 
FINAL_BUILD_DIR := $(subst $(space),,$(TEMP_BUILD_DIR))
FINAL_BUILD_DIR := $(subst $\",,$(FINAL_BUILD_DIR))
export FINAL_BUILD_DIR

BR2_RPI3_PATH_EXTERNAL:=$(shell pwd)/rpi-packages/
export BR2_RPI3_PATH_EXTERNAL

RPI3_MAKE_CMD=make -C buildroot-rpi3/ O=$(FINAL_BUILD_DIR) \
				BR2_EXTERNAL=$(BR2_RPI3_PATH_EXTERNAL) \
				BR2_DL_DIR=$(RPI3_START_DIR)/dl \
				BINARIES_DIR=$(FINAL_BUILD_DIR)/images/

fresh:
	@if [ ! -d $(RPI3_BUILDROOT_DIR) ]; then \
		git clone  https://github.com/apalos/buildroot-rpi3.git; \
	fi;
	rm -rf $(FINAL_BUILD_DIR)/build/*/.stamp_target_installed -rf
	rm -rf $(FINAL_BUILD_DIR)/build/*/.stamp_images_installed -rf
	rm -rf $(FINAL_BUILD_DIR)/build/.root
	rm -rf $(FINAL_BUILD_DIR)/target
	rm -rf $(BINARIES_DIR)/build/*/.stamp_target_installed -rf
	rm -rf $(FINAL_BUILD_DIR)/images/*
	$(RPI3_MAKE_CMD)

ragepie:
	make sickrage_defconfig

update_config:
	@cp builds/build_rpi3/.config rpi-packages/configs/sickrage_defconfig

%:
	$(RPI3_MAKE_CMD) $@
