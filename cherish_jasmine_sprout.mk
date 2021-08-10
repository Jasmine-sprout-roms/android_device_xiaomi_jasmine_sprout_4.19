#
# Copyright (C) 2018 The Xiaomi-SDM660 Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit device configuration
$(call inherit-product, device/xiaomi/jasmine_sprout/device.mk)

# Inherit Lineage special items
$(call inherit-product, vendor/cherish/config/common_full_phone.mk)

# Define first api level
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Device identifier
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := cherish_jasmine_sprout
PRODUCT_DEVICE := jasmine_sprout
PRODUCT_MODEL := Mi A2

# Build Description
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="redfin-user 11 RQ3A.210705.001 7380771 release-keys" \
    PRODUCT_NAME="jasmine_sprout" \
    TARGET_DEVICE="jasmine_sprout"

# Build Fingerprint
BUILD_FINGERPRINT := "google/redfin/redfin:11/RQ3A.210705.001/7380771:user/release-keys"

# Cherish Properties
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_INCLUDE_LIVE_WALLPAPERS := false
CHERISH_BUILD_TYPE := OFFICIAL

# Inherit from custom vendor.
$(call inherit-product, vendor/xiaomi/MiuiCamera/config.mk)

# Maintainer Props
PRODUCT_GENERIC_PROPERTIES += \
    ro.cherish.maintainer = PrashantShukla

# Gapps
WITH_GMS := true
TARGET_GAPPS_ARCH := arm64
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ARCORE := false

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Launcher
ifneq ($(WITH_GMS),true)
USE_LAWNCHAIR := true
endif

SELINUX_IGNORE_NEVERALLOWS_ON_USER =true

