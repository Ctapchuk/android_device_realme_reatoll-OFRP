#!/sbin/sh

setenforce 0

sleep 3
ln -sf /dev/block/mapper/product /dev/block/bootdevice/by-name/product

sleep 1
ln -sf /dev/block/mapper/vendor /dev/block/bootdevice/by-name/vendor

sleep 1
ln -sf /dev/block/mapper/system /dev/block/bootdevice/by-name/system
#
