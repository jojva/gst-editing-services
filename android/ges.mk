LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE:= libges-0.10
#LOCAL_ARM_MODE := arm

built_source_make = gesmarshal.c

LOCAL_SRC_FILES := 				\
	$(built_source_make)			\
	ges.c					\
	ges-enums.c				\
	ges-custom-source-clip.c		\
	ges-simple-layer.c		\
	ges-timeline.c				\
	ges-layer.c			\
	ges-clip.c			\
	ges-pipeline.c			\
	ges-source-clip.c			\
	ges-uri-clip.c		\
	ges-operation-clip.c		\
	ges-base-transition-clip.c		\
	ges-transition-clip.c	\
	ges-test-clip.c		\
	ges-title-clip.c		\
	ges-overlay-clip.c			\
	ges-text-overlay-clip.c		\
	ges-track.c				\
	ges-track-element.c			\
	ges-source.c			\
	ges-operation.c			\
	ges-uri-source.c			\
	ges-image-source.c		\
	ges-transition.c			\
	ges-audio-transition.c		\
	ges-video-transition.c		\
	ges-video-test-source.c		\
	ges-audio-test-source.c		\
	ges-title-source.c		\
	ges-text-overlay.c		\
	ges-screenshot.c			\
	ges-formatter.c				\
	ges-keyfile-formatter.c			\
	ges-utils.c

$(GES_TOP)/ges/gesmarshal.h:
	make -C $(GES_TOP)/ges gesmarshal.h

$(GES_TOP)/ges/gesmarshal.c: $(GES_TOP)/ges/gesmarshal.h
	make -C $(GES_TOP)/ges gesmarshal.c

LOCAL_SRC_FILES := $(addprefix ../ges/,$(LOCAL_SRC_FILES))

LOCAL_CFLAGS := $(GST_CFLAGS) \
	-I$(GES_TOP) \
	$(shell $(PKG_CONFIG) gstreamer-pbutils --cflags)

LOCAL_SHARED_LIBRARIES := \
	libgstpbutils-0.10	\
	libgstcontroller-0.10	\
	libgstvideo-0.10	\
	libgstreamer-0.10       \
	libglib-2.0             \
	libgthread-2.0          \
	libgmodule-2.0          \
	libgobject-2.0

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
