#!/sbin/sh

# This script is needed to automatically set device props.

load_RMX2061()
{
    resetprop "ro.product.model" "realme 6 Pro"
    resetprop "ro.product.name" "RMX2061"
    resetprop "ro.build.product" "RMX2061"
    resetprop "ro.product.device" "RMX2061"
    resetprop "ro.product.product.device" "RMX2061"
    resetprop "ro.vendor.product.device" "RMX2061"
    resetprop "ro.separate.soft" "19721"
    echo "realme 6 Pro detected - using RMX2061 props"
}

load_RMX2170()
{
    resetprop "ro.product.model" "realme 7 Pro"
    resetprop "ro.product.name" "RMX2170"
    resetprop "ro.build.product" "RMX2170"
    resetprop "ro.product.device" "RMX2170"
    resetprop "ro.product.product.device" "RMX2170"
    resetprop "ro.vendor.product.device" "RMX2170"
    resetprop "ro.separate.soft" "206B1"
    echo "realme 7 Pro detected - using RMX2170 props"
}

project=$(cat /proc/oppoVersion/prjName)
echo $project

case $project in
    "206B1")
        load_RMX2170
        ;;
    *)
        load_RMX2061
        ;;
esac

exit 0
