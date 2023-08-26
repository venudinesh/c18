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

# Inherit some common Derpfest stuff.
$(call inherit-product, vendor/derp/config/common_full_phone.mk)

# Setup Derp options
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_GAPPS_ARCH := arm64

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED := true

# FOD Animations
EXTRA_UDFPS_ANIMATIONS := true

# Quick Tap
TARGET_SUPPORTS_QUICK_TAP := true

# Official-ify
DERP_BUILDTYPE := UnOfficial

# Boot animation
scr_resolution := 1080
TARGET_SCREEN_HEIGHT := 2240
TARGET_SCREEN_WIDTH := 1080

PRODUCT_NAME := colt_nashc
PRODUCT_DEVICE := nashc
PRODUCT_MANUFACTURER := Realme
PRODUCT_BRAND := Realme
PRODUCT_MODEL := Realme 8

PRODUCT_GMS_CLIENTID_BASE := android-realme

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=RMX3085L1 \
    PRODUCT_NAME=RMX3085 \
    PRIVATE_BUILD_DESC="RMX3085-user 12 SP1A.210812.016 R.GDPR.11887c9-1 release-keys"

BUILD_FINGERPRINT := realme/RMX3085/RMX3085L1:12/SP1A.210812.016/R.GDPR.11887c9-1:user/release-keyss
