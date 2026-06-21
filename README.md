# Lenovo Tab M10 5G (TB360ZU) Device Tree

Device tree for Lenovo Tab M10 5G.

## Device Information

| Item          | Value                                   |
| ------------- | --------------------------------------- |
| Device        | Lenovo Tab M10 5G                       |
| Model         | TB360ZU                                 |
| Codename      | linden                                  |
| SoC           | Qualcomm Snapdragon 695 (SM6375 / Holi) |
| CPU           | 2x Kryo 660 Gold + 6x Kryo 660 Silver   |
| GPU           | Adreno 619                              |
| Display       | 1200x2000 WUXGA+                        |
| Refresh Rate  | 90Hz                                    |
| RAM           | 4GB / 6GB                               |
| Storage       | 128GB UFS                               |
| Android Stock | ZUI 16 (Android 14)                     |
| Kernel        | Linux 5.4                               |

## Status

### Working

* Boot
* Display
* Touchscreen
* Audio
* Wi-Fi
* Bluetooth
* Sensors
* Camera
* USB
* Charging

### Known Issues

* Work in progress

## Source Information

Kernel source obtained from Lenovo Open Source Release:

Version:

15.0.140

Stock firmware used:

TB360ZU_ROW_OPEN_USER_Q00024.0_U_ZUI_16.0.933_ST_260117

## Build Instructions

```bash
source build/envsetup.sh
lunch lineage_TB360ZU-userdebug
mka bacon
```

## Credits

* LineageOS
* Qualcomm CAF
* Lenovo Open Source Team

## Disclaimer

This project is not affiliated with Lenovo or Qualcomm.
Flash at your own risk.
