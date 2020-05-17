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

#add gapps directly
GAPPS_BUILD := false

# Build with GApps if GAPPS_BUILD is true
 ifeq ($(GAPPS_BUILD),true)
     WITH_GAPPS := true
     TARGET_GAPPS_ARCH := arm64
#     IS_PHONE := true
#     TARGET_SHIPS_SEPERATE_GAPPS_BUILD := true
 else
     WITH_GAPPS := false
 endif

# Inherit device configuration
$(call inherit-product, device/xiaomi/clover/device.mk)

# Inherit from Havoc custom product configuration
$(call inherit-product, vendor/havoc/config/common_full_phone.mk)

DEVICE_PATH := device/xiaomi/clover

PRODUCT_PROPERTY_OVERRIDES += \
	ro.havoc.maintainer=ici

# Device identifier
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_PLATFORM := SDM660
PRODUCT_NAME := havoc_clover
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_DEVICE := clover
PRODUCT_MODEL := MI PAD 4

# CarbonRom Maintainer
PRODUCT_PROPERTY_OVERRIDES += \
    ro.havoc.maintainer="ici"

PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=clover \
	PRIVATE_BUILD_DESC="clover-user 9 PKQ1.180904.001 V10.3.4.0.PDCCNXM release-keys"

BUILD_FINGERPRINT="xiaomi/clover/clover:9/PKQ1.180904.001/V10.3.4.0.PDCCNXM:user/release-keys"

TARGET_VENDOR_PRODUCT_NAME := clover
