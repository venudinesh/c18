#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from device makefile.
$(call inherit-product, device/realme/nashc/device.mk)

# Inherit some common SparkOS stuff.
$(call inherit-product, vendor/spark/config/common_full_phone.mk)

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1080

# Spark specific flags
EXTRA_UDFPS_ANIMATIONS := true
TARGET_SUPPORTS_QUICK_TAP := false
TARGET_USES_AOSP_RECOVERY := true
TARGET_SUPPORTS_GOOGLE_RECORDER := false
TARGET_INCLUDE_STOCK_ARCORE := false
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_USE_PIXEL_CHARGER := false
TARGET_USES_BLUR := true
WITH_GAPPS=true
SPARK_BUILD_TYPE := UNofficial


PRODUCT_NAME := lineage_nashc
PRODUCT_DEVICE := nashc
PRODUCT_MANUFACTURER := Realme
PRODUCT_BRAND := Realme
PRODUCT_MODEL := Realme 8

PRODUCT_GMS_CLIENTID_BASE := android-realme

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=RMX3085L1 \
    PRODUCT_NAME=RMX3085 \
    PRIVATE_BUILD_DESC="RMX3085-user 12 SP1A.210812.016 R.GDPR.11887c9-1 release-keys"

BUILD_FINGERPRINT := realme/RMX3085/RMX3085L1:12/SP1A.210812.016/R.GDPR.11887c9-1:user/release-keys
