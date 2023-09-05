#!/system/bin/sh

# This script is needed to automatically set GUI props for unified devices.

load_RMX2061()
{
    setprop "fox.status.left.offset" "261";
    echo "I:GUI-props: using props for" $project >> $LOGF;
}

load_RMX3081_2170()
{
    setprop "fox.status.left.offset" "181";
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

exit 0
