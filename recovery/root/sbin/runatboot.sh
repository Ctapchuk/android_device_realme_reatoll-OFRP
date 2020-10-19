#!/sbin/sh
#
# TODO: this kludge is needed to prevent issues with mounting
# system and vendor in zip installers; there must be another way!
#

sleep 1
mount /vendor > /dev/null 2>&1

sleep 1
mount /system_root > /dev/null 2>&1

sleep 1
umount /vendor > /dev/null 2>&1
umount /system_root > /dev/null 2>&1

exit 0
#
