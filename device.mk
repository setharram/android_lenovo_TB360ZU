LOCAL_PATH := device/lenovo/TB360ZU

# ─── A/B ──────────────────────────────────────────────────
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot vendor_boot dtbo \
    system system_ext product vendor odm \
    vbmeta vbmeta_system

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# ─── Virtual A/B ──────────────────────────────────────────
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# ─── Power ────────────────────────────────────────────────
# Confirmed real module in tree: android.hardware.power-service-qti
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

# ─── fstab ────────────────────────────────────────────────
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# ─── Init scripts ─────────────────────────────────────────
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init/init.TB360ZU.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.TB360ZU.rc

# ─── Soong namespaces ─────────────────────────────────────
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    device/lenovo/TB360ZU \
    vendor/lenovo/TB360ZU \
    hardware/qcom-caf/common \
    vendor/qcom/opensource/display \
    vendor/qcom/opensource/commonsys/display \
    vendor/qcom/opensource/commonsys-intf/display \

# ─── Shipping API level ───────────────────────────────────
PRODUCT_SHIPPING_API_LEVEL := 33

# ─── Properties ───────────────────────────────────────────
include $(LOCAL_PATH)/vendor_prop.mk
