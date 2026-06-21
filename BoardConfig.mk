DEVICE_PATH := device/lenovo/TB360ZU

# ─── Platform ─────────────────────────────────────────────
# Confirmed from live_fdt.dts: compatible = "qcom,blair-mtp"
TARGET_BOARD_PLATFORM           := holi
TARGET_BOOTLOADER_BOARD_NAME    := holi
BOARD_USES_QCOM_HARDWARE        := true

# ─── Architecture ─────────────────────────────────────────
TARGET_ARCH                     := arm64
TARGET_ARCH_VARIANT             := armv8-a
TARGET_CPU_ABI                  := arm64-v8a
TARGET_CPU_ABI2                 :=
TARGET_CPU_VARIANT              := generic
TARGET_CPU_VARIANT_RUNTIME      := kryo660

TARGET_2ND_ARCH                 := arm
TARGET_2ND_ARCH_VARIANT         := armv8-a
TARGET_2ND_CPU_ABI              := armeabi-v7a
TARGET_2ND_CPU_ABI2             := armeabi
TARGET_2ND_CPU_VARIANT          := generic
TARGET_2ND_CPU_VARIANT_RUNTIME  := kryo660

# ─── Prebuilt Kernel ──────────────────────────────────────
# Using stock prebuilt kernel — source build comes later
TARGET_FORCE_PREBUILT_KERNEL    := true
TARGET_PREBUILT_KERNEL          := $(DEVICE_PATH)/prebuilt/Image
BOARD_PREBUILT_DTBIMAGE_DIR     := $(DEVICE_PATH)/prebuilt/
TARGET_PREBUILT_DTB             := $(DEVICE_PATH)/prebuilt/dtb.img

# Kernel image name
BOARD_KERNEL_IMAGE_NAME         := Image

# Boot image header — confirmed from stock vendor_boot unpack
BOARD_BOOT_HEADER_VERSION       := 3
BOARD_MKBOOTIMG_ARGS            += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Kernel cmdline — extracted from live_fdt.dts bootargs
BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200n8 \
    androidboot.hardware=qcom \
    androidboot.console=ttyMSM0 \
    androidboot.memcg=1 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    swiotlb=0 \
    loop.max_part=7 \
    cgroup.memory=nokmem,nosocket \
    pcie_ports=compat \
    iptable_raw.raw_before_defrag=1 \
    ip6table_raw.raw_before_defrag=1 \
    androidboot.selinux=permissive

BOARD_KERNEL_BASE               := 0x00000000
BOARD_KERNEL_PAGESIZE           := 4096

# ─── Display ──────────────────────────────────────────────
# Confirmed from live_fdt.dts:
#   model = hx83102 amoled video, 1200x2000 (0x4b0 x 0x7d0), 90Hz
TARGET_SCREEN_WIDTH             := 1200
TARGET_SCREEN_HEIGHT            := 2000
TARGET_SCREEN_DENSITY           := 240

# ─── A/B Virtual A/B ──────────────────────────────────────
# Confirmed from lpdump: Header flags: virtual_ab_device
AB_OTA_UPDATER                  := true
BOARD_USES_RECOVERY_AS_BOOT     := false
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true

AB_OTA_PARTITIONS               := \
    boot \
    vendor_boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    odm \
    vbmeta \
    vbmeta_system

# ─── Partitions (from lpdump — exact values) ──────────────
# Super partition
BOARD_SUPER_PARTITION_SIZE      := 12884901888
BOARD_SUPER_PARTITION_GROUPS    := qti_dynamic_partitions_a \
                                   qti_dynamic_partitions_b

BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system system_ext product vendor odm

BOARD_QTI_DYNAMIC_PARTITIONS_A_SIZE := 12880707584
BOARD_QTI_DYNAMIC_PARTITIONS_B_SIZE := 12880707584

# Individual partition sizes (sectors × 512, from lpdump)
BOARD_ODMIMAGE_PARTITION_SIZE         := 1069056        # 2088 sectors
BOARD_PRODUCTIMAGE_PARTITION_SIZE     := 3074543616     # 6004968 sectors
BOARD_SYSTEMIMAGE_PARTITION_SIZE      := 4113330176     # 8033848 sectors
BOARD_SYSTEM_EXTIMAGE_PARTITION_SIZE  := 518131712      # 1011976 sectors
BOARD_VENDORIMAGE_PARTITION_SIZE      := 748146688      # 1460912 sectors

# Boot partition (standard size for blair)
BOARD_BOOTIMAGE_PARTITION_SIZE        := 0x6000000
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 0x6000000

# Filesystems — confirmed ext4 from live device
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE       := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE       := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE      := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE          := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE   := ext4

TARGET_USERIMAGES_USE_EXT4      := true
TARGET_USERIMAGES_USE_F2FS      := true

# Copy-out targets
TARGET_COPY_OUT_VENDOR          := vendor
TARGET_COPY_OUT_ODM             := odm
TARGET_COPY_OUT_PRODUCT         := product
TARGET_COPY_OUT_SYSTEM_EXT      := system_ext

# ─── Storage — UFS ────────────────────────────────────────
# Confirmed from live_fdt.dts: compatible = "qcom,ufshc"
TARGET_USES_UFS                 := true

# ─── AVB ──────────────────────────────────────────────────
BOARD_AVB_ENABLE                := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH     := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM    := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 0
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# ─── SELinux ──────────────────────────────────────────────
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Enforce contemporary global QCOM policy integration mapping tables
BOARD_USES_QCOM_SB_POLICIES := true

# ─── VINTF ────────────────────────────────────────────────
DEVICE_MANIFEST_FILE            := $(DEVICE_PATH)/configs/vintf/manifest.xml
DEVICE_MATRIX_FILE              := $(DEVICE_PATH)/configs/vintf/compatibility_matrix.xml

# ─── Recovery ─────────────────────────────────────────────
TARGET_RECOVERY_PIXEL_FORMAT    := RGBX_8888
TARGET_RECOVERY_FSTAB           := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# ─── Security patch override (for older vendor) ───────────

# ─── 64-bit app support ───────────────────────────────────
# TB360ZU is arm64 — must explicitly enable 64-bit app support
# (common_full_tablet_wifionly.mk defaults to 32-bit-only)
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true

# ─── DTB in boot image ────────────────────────────────────
# Required when using BOARD_PREBUILT_DTBIMAGE_DIR
# boot header v3 on VAB devices embeds DTB inside boot/vendor_boot
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Required by vendor/lineage/build/tasks/kernel.mk even with prebuilt kernel
TARGET_KERNEL_ARCH := arm64

# Required by vendor/lineage/build/tasks/kernel.mk version comparison logic
# Your stock kernel is Linux 5.4 (confirmed from Lenovo open-source kernel/msm-5.4)
TARGET_KERNEL_VERSION := 5.4