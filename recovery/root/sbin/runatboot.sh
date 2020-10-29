#!/sbin/sh
#
# TODO: this kludge is needed to prevent issues with mounting
# system and vendor in zip installers; there must be another way!
#

# bail out without doing anything; this requires more thought ...
exit 0

file_getprop() {
  local F=$(grep -m1 "^$2=" "$1" | cut -d= -f2)
  echo $F | sed 's/ *$//g'
}

sleep 1
mount /vendor > /dev/null 2>&1
if [ -e /vendor/build.prop ]; then
   cp /vendor/build.prop /tmp/
fi

sleep 1
mount /product > /dev/null 2>&1

sleep 1
mount /system_root > /dev/null 2>&1

sleep 1
umount /product > /dev/null 2>&1
umount /vendor > /dev/null 2>&1
umount /system_root > /dev/null 2>&1

# tag on fingerprint stuff here
if [ -e /tmp/build.prop ]; then
   R=$(which resetprop)
   if [ -n "$R" ]; then
     F=$(file_getprop "/tmp/build.prop" "ro.vendor.build.fingerprint")
     if [ -n "$F" ]; then
        $R ro.build.fingerprint "$F"
     fi
   fi
   unset F
   unset R
fi

exit 0
#
