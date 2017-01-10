#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
# The proprietary variant sets USE_CAMERA_STUB := false, this way
# we use the camera stub when the vendor tree isn't present, and
# the true camera library when the vendor tree is available.

USE_CAMERA_STUB := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture and CPU
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
ARCH_ARM_HAVE_ARMV7A := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_ARCH_LOWMEM := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Compiler Optimization
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HIGH_OPTIMIZATION_COMPAT := true
TARGET_USE_O3 := true

# cortex-a9 is used to take advantage of NEON optimizations
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon

# Compiler flags
TARGET_GLOBAL_CFLAGS += -mfloat-abi=softfp -mfpu=neon-vfpv4 -mtune=cortex-a9
TARGET_GLOBAL_CPPFLAGS += -mfloat-abi=softfp -mfpu=neon-vfpv4 -mtune=cortex-a9
COMMON_GLOBAL_CFLAGS += -DUSE_MDP3
COMMON_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=480
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP_WITH_GENLOCK

# Kernel
TARGET_KERNEL_SOURCE := kernel/lge/msm7x27a-common
BOARD_KERNEL_BASE := 0x00200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x1200000
BOARD_KERNEL_PAGESIZE := 4096

# QCOM Display Stuff
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
TARGET_QCOM_DISPLAY_VARIANT := caf
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_QCOM_BSP := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_NO_INITLOGO := true

# Graphics
TARGET_USES_OVERLAY := false
TARGET_HAVE_BYPASS := false
TARGET_USES_GENLOCK := true
TARGET_QCOM_HDMI_OUT := false
TARGET_NO_HW_VSYNC := true
BOARD_EGL_CFG := device/lge/msm7x27a-common/config/egl.cfg
BOARD_USE_MHEAP_SCREENSHOT := true
TARGET_DOESNT_USE_FENCE_SYNC := true
QCOM_BSP_WITH_GENLOCK := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_USES_ADRENO_200 := true

## Webkit
PRODUCT_PACKAGES += \
    libwebcore	

# (classic webview provider)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.webview.provider=classic

ENABLE_WEBGL := true
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
JS_ENGINE	:= v8
HTTP	:= chrome
WITH_JIT	:= true
ENABLE_JSC_JIT	:= true
TARGET_WEBKIT_USE_MORE_MEMORY	:= true
TARGET_FORCE_CPU_UPLOAD	:= true
TARGET_USES_JELLYBEAN_BASEBAND := true

# Media 
TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_QCOM_LEGACY_OMX := true

# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Audio 
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_PROVIDES_LIBAUDIO := true
BOARD_QCOM_VOIP_ENABLED := true
BOARD_USES_LEGACY_ALSA_AUDIO := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

BOARD_SEPOLICY_DIRS += \
       device/lge/msm7x27a-common/sepolicy

BOARD_SEPOLICY_UNION += \
       untrusted_app.te \
       vold.te \
	file_contexts \
	app.te \
	bluetooth.te \
	device.te \
	domain.te \
	drmserver.te \
	file.te \
	hci_init.te \
	healthd.te \
	init.te \
	init_shell.te \
	keystore.te \
	kickstart.te \
	mediaserver.te \
	netd.te \
	rild.te \
	surfaceflinger.te \
	system.te \
	ueventd.te \
	wpa_supplicant.te

# Misc
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
BOARD_USE_LEGACY_SENSORS_FUSION := false
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_BOOTANIMATION_HALF_RES := true
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm7x27a
TARGET_PROVIDES_LIBLIGHT := true

# Wi-Fi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_EXT_MODULE_PATH             := "/system/lib/modules/librasdioif.ko"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_EXT_MODULE_NAME             := "librasdioif"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_FW_PATH_P2P          := "p2p"
WIFI_DRIVER_FW_PATH_PARAM        := "/data/misc/wifi/fwpath"
BOARD_LEGACY_NL80211_STA_EVENTS  := true
