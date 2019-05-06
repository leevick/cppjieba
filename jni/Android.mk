LOCAL_PATH := $(call my-dir)/../deps/gtest

include $(CLEAR_VARS)

LOCAL_MODULE    := jieba
LOCAL_CFLAGS += -O3 -g
LOCAL_CPPFLAGS += -std=c++11
LOCAL_CPP_FEATURES := rtti
LOCAL_CFLAGS += -Wall -Wno-write-strings -Wno-unused-function -Wno-unused-variable
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_SRC_FILES := \
	src/gtest.cc	\
	src/gtest-death-test.cc	\
	src/gtest-filepath.cc	\
	src/gtest-internal-inl.h	\
	src/gtest_main.cc	\
	src/gtest-port.cc	\
	src/gtest-printers.cc	\
	src/gtest-test-part.cc	\
	src/gtest-typed-test.cc

LOCAL_LDLIBS += -landroid -llog -pthread
include $(BUILD_STATIC_LIBRARY)

LOCAL_PATH := $(NDK_PROJECT_PATH)
include $(CLEAR_VARS)

LOCAL_MODULE    := demo
LOCAL_CFLAGS += -O3 -g
LOCAL_CPPFLAGS += -std=c++11
LOCAL_CPP_FEATURES := rtti
LOCAL_CFLAGS += -Wall -Wno-write-strings -Wno-unused-function -Wno-unused-variable
LOCAL_C_INCLUDES := $(NDK_PROJECT_PATH)/include \
					$(NDK_PROJECT_PATH)/deps
LOCAL_SRC_FILES := \
	test/demo.cpp

LOCAL_LDLIBS += -landroid -llog -pthread
LOCAL_STATIC_LIBRARIES := jieba

include $(BUILD_EXECUTABLE)


