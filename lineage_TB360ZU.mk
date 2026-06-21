# Inherit common LineageOS phone config
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device config
$(call inherit-product, device/lenovo/TB360ZU/device.mk)

# Inherit vendor blobs
$(call inherit-product-if-exists, vendor/lenovo/TB360ZU/TB360ZU-vendor.mk)

# Device identifiers
PRODUCT_BRAND           := Lenovo
PRODUCT_DEVICE          := TB360ZU
PRODUCT_MANUFACTURER    := Lenovo
PRODUCT_MODEL           := Lenovo Tab M10 5G
PRODUCT_NAME            := lineage_TB360ZU

# Build fingerprint — from live device confirmed value
BUILD_FINGERPRINT := "Lenovo/TB360ZU/TB360ZU:14/UKQ1.231108.001/ZUI_16.0.935_260507_ROW:user/release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-lenovo

# Security patch override
# Prevents system/vendor version mismatch errors since our vendor
# blobs are from ZUI 16 (Android 14) but LineageOS is Android 15
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.build.security_patch=2099-12-31

# Kernel 5.4 does not support userfaultfd(2) + MREMAP_DONTUNMAP
PRODUCT_ENABLE_UFFD_GC := false
