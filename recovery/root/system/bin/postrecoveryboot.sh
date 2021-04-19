#!/sbin/sh
#
# TODO: this kludge is needed to prevent issues with mounting
# system and vendor in some zip installers and in the gui
#
sleep 1
mount -w /vendor > /dev/null 2>&1
mount -w /system_root > /dev/null 2>&1

sleep 1
umount /vendor > /dev/null 2>&1
umount /system_root > /dev/null 2>&1

exit 0
#
