#!/bin/bash
function get_devices(){
  devices=$(adb devices | grep -v 'devices' | grep -Po '^\S+')
  for d in $devices
  do
    echo $d
  done
}

function device_choose(){
  devices=$(get_devices)
  #$(adb devices | grep -v 'devices'| grep -Po '^\S+' )
  i=0
  echo "Choose one devices:" >&2
  for device in  $devices
  do
    let "i=i+1"
    printf '%-2s). %2s\n' $i $device >&2
  done

  printf "\nYour option: " >&2
  read opt
  
  echo $devices | cut -d ' ' -f $opt
}

function device_count(){
  let "count=$(adb devices | wc -l)-2"
  echo $count
}

function first_device(){
  device=$(adb devices | grep -v 'devices'| grep -Po '^\S+' | cut -d ' ' -f 1 )
  echo $device
}


function main_detection(){
  source ./.default_device
  devices=$(get_devices)
  same_device=0
  for d in $devices
  do
    if [ "$d" == "$device" ];
    then
      same_device=1
    fi
  done
  echo $same_device>&2
}

function get_last_file(){
  lfn=$1
  last=$(ls | grep -Po "$lfn\d+\.png" | sort -n | head -n 1)
  echo $last
}
