![OFRP](https://i.ibb.co/4WgF7pR/banner-2.png "OFRP")

OrangeFox Recovery Project (OFRP) R11.x for realme 6 Pro (RMX2061/3)
======================================

# How to build
Check OFRP official guide https://wiki.orangefox.tech/en/dev/building

# Fix decryption on Android 11 (RUI2.0) thanks @logotoy73 for helping
1. To provide decryption /data on Android 11 with keymaster@4.0 you need to fix mounting binderfs
--Apply these commits to the required repositories to fix the binderfs mount error (now the recovery will not get stuck on the splash screen):
https://github.com/omnirom/android_system_sepolicy/commit/50c5d731e0aa4098aac293e4024b213b5c445b99
https://github.com/omnirom/android_system_sepolicy/commit/74affd140396b74840e5dd8018b423ffcbe25a18
https://github.com/TeamWin/android_bootable_recovery/commit/cd79c90d27941edbda6a92593835aec2a99c2ee9
2. Now all you have to do is configure the flags to support decryption

# Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
SoC     | Qualcomm SM7125 Snapdragon 720G
CPU     | Octa-core (2x2.3 GHz Kryo 465 Gold & 6x1.8 GHz Kryo 465 Silver)
GPU     | Adreno 618
Memory  | 6/8 GB RAM
Shipped Android Version | 10.0 with Realme UI
Storage | 64/128GB UFS 2.1
Battery | Non-removable Li-Po 4300 mAh battery
Display | 1080 x 2400 pixels, 20:9 ratio, 6.6 inches, IPS LCD
Rear Camera  | 64MP (wide) / 12MP (telephoto) / 8MP (ultrawide) / 2MP (macro)
Front Camera | 16MP (wide) / 8MP (ultrawide)

## Device picture
![realme 6 pro](https://fdn2.gsmarena.com/vv/pics/realme/realme-6-pro-1.jpg "realme 6 pro")
