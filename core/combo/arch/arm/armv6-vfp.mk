# Configuration for Linux on ARM.
# Generating binaries for the ARMv6-VFP architecture and higher
#
ARCH_ARM_HAVE_THUMB_SUPPORT     := true
ARCH_ARM_HAVE_FAST_INTERWORKING := true
ARCH_ARM_HAVE_64BIT_DATA        := true
ARCH_ARM_HAVE_HALFWORD_MULTIPLY := true
ARCH_ARM_HAVE_CLZ               := true
ARCH_ARM_HAVE_FFS               := true
ARCH_ARM_HAVE_VFP               := true

ifeq ($(strip $(TARGET_CPU_VARIANT)),)
TARGET_CPU_VARIANT              := generic
endif
ifeq ($(strip $(TARGET_ARCH_VARIANT_FPU)),)
TARGET_ARCH_VARIANT_FPU         := vfp
endif

ifeq ($(strip $(TARGET_ARCH_VARIANT_CPU)),)
	TARGET_ARCH_VARIANT_CPU         := arm1136jf-s
endif

arch_variant_cflags := \
    -mfloat-abi=softfp \
    -mcpu=$(TARGET_ARCH_VARIANT_CPU) \
    -mfpu=$(TARGET_ARCH_VARIANT_FPU) \
    -D__ARM_ARCH_5__ \
    -D__ARM_ARCH_5T__ \
    -D__ARM_ARCH_5E__ \
    -D__ARM_ARCH_5TE__

ifeq ($(strip $(TARGET_ARCH_VARIANT_CPU)),arm1176jzf-s)
	
	ARCH_ARM_HAVE_THUMB_SUPPORT     := false
	ARCH_ARM_HAVE_FAST_INTERWORKING := false
	
	arch_variant_cflags += \
		-mtune=$(TARGET_ARCH_VARIANT_CPU) \
		-msoft-float \
		-D__ARM_ARCH_6__ \
		-D__ARM_ARCH_6J__ \


endif
