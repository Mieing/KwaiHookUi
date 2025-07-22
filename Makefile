ARCHS = arm64

TARGET := iphone:clang:latest:14.0

DEBUG = 0

FINALPACKAGE=1

INSTALL_TARGET_PROCESSES = SpringBoard

THEOS_DEVICE_IP = 192.168.10.166
THEOS_DEVICE_PORT = 22

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = KwaiHookUi

KwaiHookUi_FILES = KwaiHookUi.x
KwaiHookUi_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
