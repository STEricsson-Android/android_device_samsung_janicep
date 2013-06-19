# Include common makefile
$(call inherit-product, device/samsung/u8500-common/common.mk)

# Call cm.mk because somehow it's not being called!
$(call inherit-product, device/samsung/janicep/cm.mk)


LOCAL_PATH := device/samsung/janicep

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is HDPI
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Packages
PRODUCT_PACKAGES += \
    GalaxyS2Settings

PRODUCT_PACKAGES += \
	com.android.nfc_extras \
        libnfc \
	libnfc_jni \
	Nfc \
        Tag
# NFC
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
#NFCEE ACCESS CONTROL
	NFCEE_ACCESS_PATH := device/samsung/u8500-common/NFC/nfcee_access.xml
	NFCEE_ACCESS_PATH := device/samsung/u8500-common/NFC/nfcee_access_debug.xml

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.samsungjanicep:root/fstab.samsungjanicep \
    $(LOCAL_PATH)/rootdir/init.samsungjanicep.rc:root/init.samsungjanice.rcp \
    $(LOCAL_PATH)/rootdir/init.samsungjanicep.usb.rc:root/init.samsungjanicep.usb.rc \
    $(LOCAL_PATH)/rootdir/prerecovery.rc:root/prerecovery.rc \
    $(LOCAL_PATH)/rootdir/ueventd.samsungjanicep.rc:root/ueventd.samsungjanicep.rc

# RIL
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/manuf_id.cfg:/system/etc/AT/manuf_id.cfg \
   $(LOCAL_PATH)/configs/model_id.cfg:/system/etc/AT/model_id.cfg \
   $(LOCAL_PATH)/configs/system_id.cfg:/system/etc/AT/system_id.cfg

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/usr/keylayout/janice-kp.kl:system/usr/keylayout/janice-kp.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl

# Use non-open-source parts if present
$(call inherit-product-if-exists, vendor/samsung/u8500-common/janicep/janice-vendor.mk)
