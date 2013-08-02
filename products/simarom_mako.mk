#GCC
TARGET_GCC_VERSION_EXP := 4.9

# Inherit SaberMod common gsm bits
$(call inherit-product, vendor/sm/configs/gsm.mk)

# Inherit AOSP device configuration for grouper.
$(call inherit-product, device/lge/mako/aosp_mako.mk)

# Mako overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/sm/overlay/mako

PRODUCT_NAME := simarom_mako
PRODUCT_DEVICE := mako
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT="google/occam/mako:4.3/JSS15J/737497:user/release-keys" PRIVATE_BUILD_DESC="occam-user 4.3 JSS15J 737497 release-keys"

# APN list
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/mako/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# Kernel modules
ifeq ($(USING_BUILD_SCRIPTS),true)
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/mako/system/lib/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    vendor/sm/prebuilts/mako/system/lib/modules/cifs.ko:system/lib/modules/cifs.ko
endif

# # remount scripts for system
PRODUCT_COPY_FILES += \
    vendor/sm/prebuilts/mako/system/etc/mount-rw:system/etc/mount-rw \
    vendor/sm/prebuilts/mako/system/etc/mount-ro:system/etc/mount-ro

# mako audio
-include frameworks/base/data/sounds/AudioPackage10.mk