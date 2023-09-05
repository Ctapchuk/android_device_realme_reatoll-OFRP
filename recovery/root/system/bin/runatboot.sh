#!/system/bin/sh

# This script is needed to automatically set props for unified devices.

load_RMX2061()
{
    resetprop "ro.product.model" "realme 6 Pro";
    resetprop "ro.product.name" "RMX2061";
    resetprop "ro.build.product" "RMX2061";
    resetprop "ro.product.device" "RMX2061";
    resetprop "ro.product.product.device" "RMX2061";
    resetprop "ro.vendor.product.device" "RMX2061";
    echo "I:unified-script: realme 6 Pro detected - using RMX2061 props" >> $LOGF;
}

load_RMX2170()
{
    resetprop "ro.product.model" "realme 7 Pro";
    resetprop "ro.product.name" "RMX2170";
    resetprop "ro.build.product" "RMX2170";
    resetprop "ro.product.device" "RMX2170";
    resetprop "ro.product.product.device" "RMX2170";
    resetprop "ro.vendor.product.device" "RMX2170";
    echo "I:unified-script: realme 7 Pro detected - using RMX2170 props" >> $LOGF;
}

load_RMX3081()
{
    resetprop "ro.product.model" "realme 8 Pro";
    resetprop "ro.product.name" "RMX3081";
    resetprop "ro.build.product" "RMX3081";
    resetprop "ro.product.device" "RMX3081";
    resetprop "ro.product.product.device" "RMX3081";
    resetprop "ro.vendor.product.device" "RMX3081";
    echo "I:unified-script: realme 8 Pro detected - using RMX3081 props" >> $LOGF;
}

local LOGF=/tmp/recovery.log;
project=$(cat /proc/oppoVersion/prjName);

resetprop "ro.separate.soft" $project;

case $project in
    "20711")
        load_RMX3081
        ;;
    "206B1")
        load_RMX2170
        ;;
    "19721")
        load_RMX2061
        ;;
     *)
        echo "E:unified-script: unsupported project:" $project >> $LOGF;
        ;;
esac

exit 0
