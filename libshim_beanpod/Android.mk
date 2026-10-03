LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libshim_beanpod
LOCAL_SRC_FILES := libshim_beanpod.cpp

LOCAL_C_INCLUDES := \
    system/keymaster/include

LOCAL_HEADER_LIBRARIES := \
    libhardware_headers

LOCAL_SHARED_LIBRARIES := \
    libkeymaster_messages \
    liblog

LOCAL_MULTILIB := first
LOCAL_VENDOR_MODULE := true
LOCAL_RECOVERY_MODULE := true

include $(BUILD_SHARED_LIBRARY)
