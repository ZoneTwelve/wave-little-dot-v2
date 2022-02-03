#!/bin/bash
ctime=$(date +"%s")
./screenshot.sh
convert _screenshot.png -crop 120x45+980+865  img_red-bag-1.png 
convert _screenshot.png -crop 120x45+980+675  img_red-bag-2.png 
convert _screenshot.png -crop 120x45+980+1625 img_red-bag-3.png 
convert _screenshot.png -crop 120x45+980+1505 img_red-bag-4.png 
count_down_1=$(tesseract img_red-bag-1.png stdout | tr -d '[:space:]' | grep -Po "\S{2}:\S{2}")
count_down_2=$(tesseract img_red-bag-2.png stdout | tr -d '[:space:]' | grep -Po "\S{2}:\S{2}")
count_down_3=$(tesseract img_red-bag-3.png stdout | tr -d '[:space:]' | grep -Po "\S{2}:\S{2}")
count_down_4=$(tesseract img_red-bag-4.png stdout | tr -d '[:space:]' | grep -Po "\S{2}:\S{2}")
now=$(date +"%s")
exist=0
if [ ! -z "$count_down_1" ];
then
  echo "1. $count_down_1 OK"
  exist=1
  minute=$(echo $count_down_1 | cut -d ':' -f 1)
  second=$(echo $count_down_1 | cut -d ':' -f 2)
  pos_x=980
  pos_y=865
elif [ ! -z "$count_down_2" ]
then
  echo "2. $count_down_2 OK"
  exist=2
  minute=$(echo $count_down_2 | cut -d ':' -f 1)
  second=$(echo $count_down_2 | cut -d ':' -f 2)
  pos_x=980
  pos_y=675
elif [ ! -z "$count_down_3" ]
then
  echo "3. $count_down_3 OK"
  exist=3
  minute=$(echo $count_down_3 | cut -d ':' -f 1)
  second=$(echo $count_down_3 | cut -d ':' -f 2)
  pos_x=980
  pos_y=1635
elif [ ! -z "$count_down_4" ]
then
  echo "3. $count_down_4 OK"
  exist=3
  minute=$(echo $count_down_4 | cut -d ':' -f 1)
  second=$(echo $count_down_4 | cut -d ':' -f 2)
  pos_x=980
  pos_y=1505
else
  echo "No red bag exist"
  exit
fi

let "second = minute * 60 + second "
let "target = ctime - now + second"
echo $second
echo $target

for i in $(seq 1 $target)
do
  let "cur = target - $i"
  tput cuu1
  tput el
  echo "Time reamming: "$cur"s"
  sleep 1
done
./click.sh $pos_x $pos_y 
./click.sh $pos_x $pos_y &
./click.sh $pos_x $pos_y &
./click.sh 700 1950 &
./click.sh 700 1950 
./click.sh 700 1950 
./screenshot.sh &
