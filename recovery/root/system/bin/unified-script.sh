#!/system/bin/sh
# This script is needed to automatically set device props.


load_curtana()
{
    resetprop "ro.product.model" "Redmi Note 9S"
    resetprop "ro.product.name" "curtana"
    resetprop "ro.build.product" "curtana"
    resetprop "ro.product.device" "curtana"
    resetprop "ro.vendor.product.device" "curtana"
}

load_joyeuse()
{
    resetprop "ro.product.model" "Redmi Note 9 Pro"
    resetprop "ro.product.name" "joyeuse"
    resetprop "ro.build.product" "joyeuse"
    resetprop "ro.product.device" "joyeuse"
    resetprop "ro.vendor.product.device" "joyeuse"
}

load_excalibur()
{
    resetprop "ro.product.model" "Redmi Note 9 Pro Max"
    resetprop "ro.product.name" "excalibur"
    resetprop "ro.build.product" "excalibur"
    resetprop "ro.product.device" "excalibur"
    resetprop "ro.vendor.product.device" "excalibur"
}

load_gram()
{
    resetprop "ro.product.model" "POCO M2 Pro"
    resetprop "ro.product.name" "gram"
    resetprop "ro.build.product" "gram"
    resetprop "ro.product.device" "gram"
    resetprop "ro.vendor.product.device" "gram"
}


project=$(getprop ro.boot.hwname)
echo $project

case $project in
    "curtana")
        load_curtana
        ;;
    "joyeuse")
        load_joyeuse
        ;;
    "excalibur")
        load_excalibur
        ;;
    "gram")
        load_gram
        ;;
    *)
        load_curtana
        ;;
esac

exit 0
