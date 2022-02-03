#!/bin/bash
adb -s 192.168.58.101:5555 exec-out screenrecord --output-format=h264 --size 360x760 - | ffplay -framerate 60 -framedrop -bufsize 16M -
