#!/system/bin/sh

# This script is needed to automatically move boot backup after clean flash.

check_OTA_boot()
{
boot=/data/media/Fox/OTA/boot.emmc.win
boot1=/sdcard/Fox/OTA/boot.emmc.win
if [[ -f "$boot"  &&  -d "/sdcard/Fox" ]]; then
  mkdir -p "/sdcard/Fox/OTA"
  mv "$boot" "$boot1"
  rm -rf "/data/media/Fox"
  echo "I:ofrpotafix: OTA boot image copied to /sdcard/Fox/OTA" >> $LOGF
  fi
}

local LOGF=/tmp/recovery.log;
check_OTA_boot;

exit 0
