#!/bin/bash
source ./.default_device
adb -s $device exec-out screenrecord --output-format=h264 --size 540x1140 - | 
  ffmpeg -i - -vf fps=1 -y _screenshot-%d.png
  #ffmpeg -i - -vf fps=1 -y -frames:v 1 _screenshot.png