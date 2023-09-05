#!/system/bin/sh

# This script is needed to automatically set GUI props for unified devices.
load_reatoll()
{
    setprop "fox.status.right.offset" "34";
    setprop "fox.screen.height" "2400";
}

load_RMX2061()
{
    setprop "fox.status.left.offset" "261";
    setprop "fox.status.height.offset" "108";
    setprop "fox.status.placement.offset" "38";
    echo "I:GUI-props: using props for" $project >> $LOGF;
}

load_RMX3081_2170()
{
    setprop "fox.status.left.offset" "158";
    setprop "fox.status.height.offset" "140";
    setprop "fox.status.placement.offset" "40";
    echo "I:GUI-props: using props for" $project >> $LOGF;
}

local LOGF=/tmp/recovery.log;
project=$(cat /proc/oppoVersion/prjName);

case $project in
    "206B1" | "20711")
        load_RMX3081_2170
        ;;
    "19721")
        load_RMX2061
        ;;
     *)
        echo "E:GUI-props: unsupported project:" $project >> $LOGF;
        ;;
esac

load_reatoll

exit 0
