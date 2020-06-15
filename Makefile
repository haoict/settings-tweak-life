include $(THEOS)/makefiles/common.mk
export TARGET = iphone:11.2:10.0
export ARCHS = armv7 armv7s arm64 arm64e
export THEOS_DEVICE_PORT=22
# export THEOS_DEVICE_IP=10.0.0.12
export THEOS_DEVICE_IP=192.168.0.10

# Tweak
TWEAK_NAME = SettingsTweakLife
$(TWEAK_NAME)_FILES = $(wildcard *.xm)
$(TWEAK_NAME)_LIBRARIES = 
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
include $(THEOS_MAKE_PATH)/tweak.mk

export SYSROOT=$(THEOS)/sdks/iPhoneOS11.2.sdk
export SDKVERSION=11.2

include $(THEOS_MAKE_PATH)/aggregate.mk


# Restart Preferences after install
after-install::
	install.exec "killall Preferences; open com.apple.Preferences"