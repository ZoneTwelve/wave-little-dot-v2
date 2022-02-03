#!/bin/bash
source ./common.sh
device=$(device_choose)
echo $device>&2
echo "device=\"$device\"" > .default_device