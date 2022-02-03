#!/bin/bash
source ./common.sh

fn_head="_screenshot-"
last=$(get_last_file $fn_head)
cfn="temp.png"
echo $last $cfn
convert $last -crop 250x20+0+620 $cfn
display $cfn
tesseract $cfn -l chi_tra
#mv .2.$cfn $cfn
rm -f $fn_head*
rm -f $cfn
echo "OK"

