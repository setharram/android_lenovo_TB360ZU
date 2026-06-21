# vendor_prop.mk — Lenovo Tab M10 5G TB360ZU
# Properties confirmed from live device getprop + live_fdt.dts analysis

PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.manufacturer=Qualcomm \
    ro.soc.model=SM6375

# Display — HX83102, 1200x2000, 90Hz confirmed
PRODUCT_VENDOR_PROPERTIES += \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.set_idle_timer_ms=500 \
    ro.surface_flinger.set_touch_timer_ms=750 \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    persist.demo.hdmirotationlock=false \
    ro.opengles.version=196610

# Audio — Bolero + WCD937x confirmed
PRODUCT_VENDOR_PROPERTIES += \
    ro.config.vc_call_vol_steps=7 \
    persist.audio.fluence.speaker=true \
    persist.audio.fluence.tmic.enabled=false \
    ro.vendor.audio.sdk.fluencetype=none

# WiFi — WCN3990 confirmed
PRODUCT_VENDOR_PROPERTIES += \
    wifi.aware.interface=wifi-aware0 \
    ro.hardware.wlan.dbs=1

# Bluetooth — QCA confirmed
PRODUCT_VENDOR_PROPERTIES += \
    persist.bluetooth.a2dp_offload.disabled=false \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true

# Camera
PRODUCT_VENDOR_PROPERTIES += \
    persist.camera.gyro.disable=0 \
    persist.camera.HAL3.enabled=1

# USB — USB-C with PD confirmed
PRODUCT_VENDOR_PROPERTIES += \
    vendor.usb.use_gadget_hal=1 \
    vendor.usb.controller=a600000.dwc3

# Telephony — SM6375 integrated 5G
PRODUCT_VENDOR_PROPERTIES += \
    persist.radio.multisim.config=dsds \
    ro.telephony.default_network=27,27 \
    telephony.lteOnCdmaDevice=0

# Storage — UFS
PRODUCT_VENDOR_PROPERTIES += \
    ro.sys.sdcardfs=false \
    ro.vendor.qcom.core-ctl-min-cpu=0 \
    ro.vendor.qcom.core-ctl-max-cpu=3

# PMIC / Power — PM7250B confirmed
PRODUCT_VENDOR_PROPERTIES += \
    persist.sys.usb.config=mtp \
    ro.charger.enable_suspend=1 \
    sys.shutdown.requested=true

# Performance
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.perf.scroll_opt=true \
    vendor.power.pasr.enabled=false

# hwui
PRODUCT_VENDOR_PROPERTIES += \
    ro.hwui.render_thread_atrace_enabled=false

# Disable mobile data by default (tablet mode)
PRODUCT_VENDOR_PROPERTIES += \
    ro.com.android.mobiledata=false
