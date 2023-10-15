#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="reatoll"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export DEVICE_PATH=device/realme/reatoll
	export LC_ALL="C.UTF-8"
 	export ALLOW_MISSING_DEPENDENCIES=true
 	
 	#OFR build settings & info
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export TARGET_DEVICE_ALT="RMX2061,RMX2170,RMX3081"
	export OF_SUPPORT_OZIP_DECRYPTION=1
	export TW_OZIP_DECRYPT_KEY="0000"
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export FOX_DELETE_INITD_ADDON=1
	export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
	export OF_UNBIND_SDCARD_F2FS=1
	export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1

	#OFR binary files
	export FOX_REPLACE_BUSYBOX_PS=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_SED_BINARY=1
	export OF_ENABLE_LPTOOLS=1
	export FOX_USE_NANO_EDITOR=1
	
	#OFR patches
	export OF_PATCH_AVB20=1
	export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
	export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
	
	#OTA
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
	export OF_OTA_BACKUP_STOCK_BOOT_IMAGE=1
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
	export OF_DISABLE_INCREMENTAL_OTA_BY_DEFAULT=1

	#OFR settings
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	export OF_QUICK_BACKUP_LIST="/data;/boot;"
	export OF_ALLOW_DISABLE_NAVBAR=0
	export OF_FLASHLIGHT_ENABLE=1
	export OF_USE_GREEN_LED=0
	export FOX_DELETE_AROMAFM=1
	export OF_ENABLE_USB_STORAGE=1
	export OF_HIDE_NOTCH=1
	export FOX_ENABLE_APP_MANAGER=1
	export FOX_CUSTOM_FOLDER_FOR_SETTINGS="/custom"

	lunch twrp_$FDEVICE-eng
	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
