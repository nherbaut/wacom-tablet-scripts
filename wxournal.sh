#!/usr/bin/env bash

if  xsetwacom list devices | grep -q "WL";then 
export DEVICE="Wacom Intuos Pro S (WL)"; 
else 
export DEVICE="Wacom Intuos Pro S" 
fi

echo device=$DEVICE

xsetwacom set  "$DEVICE Finger touch"  touch off
xsetwacom set "$DEVICE Pad pad" "Button" "2" "key +alt c"
xsetwacom set "$DEVICE Pad pad" "Button" "3" "key +ctrl z"
xsetwacom set "$DEVICE Pad pad" "Button" "8" "key +shift +alt c"
xsetwacom set "$DEVICE Pad pad" AbsWheelUp "key +ctrl minus"
xsetwacom set "$DEVICE Pad pad" "Button" "1" "key +alt +tab"

xsetwacom set "$DEVICE Pad pad" "Button" "9" "key +ctrl PgUp"
xsetwacom set "$DEVICE Pad pad" "Button" "10" "key +ctrl +shift PgUp"
xsetwacom set "$DEVICE Pad pad" "Button" "11" "key +ctrl PgDn"
xsetwacom set "$DEVICE Pad pad" AbsWheelDown "key +ctrl +shift ="
xsetwacom set "$DEVICE Pen eraser" "key +ctrl z"




MONITORS=$(xrandr --listactivemonitors |sed -rn "s/ [0-9]+: \+[^ ]+ [^ ]+ +(.*)/\1/p")
MONITORS=(${MONITORS// / })
if [ ${#MONITORS[@]}=2 ] 
then
	for i in "${MONITORS[@]}"
	do
	   :
	   echo "you have $i"
	   read -p "Use $i? [yN]: " UserInput
		UserInput=${UserInput:-N}
		if [ $UserInput = "y" ]
		then
			xsetwacom --set "$DEVICE Pen stylus" MapToOutput $i
			xsetwacom --set "$DEVICE Pen eraser" MapToOutput $i
			echo "Stylus bound to $i"
			break
		fi
	done

	read -p "want to use it in Portrait Orientation? [yN]" UserInput
	UserInput=${UserInput:-n}
	if [ $UserInput = "y" ]
	then
		echo "Rotating Screen $i clockwize"
		xrandr --output $i --rotate right
		xsetwacom --set "$DEVICE Pen stylus" rotate "CCW"
		xsetwacom --set "$DEVICE Pen eraser" rotate "CCW"
	else
		xrandr --output $i --rotate normal
	fi


	read -p "want to use Paper Annotation Area mode? [yN]" UserInput
	UserInput=${UserInput:-n}
	if [ $UserInput = "y" ]
	then
		xsetwacom --set "$DEVICE Pen stylus" Area 0 0 94000 60000
		xsetwacom --set "$DEVICE Pen stylus" MapToOutput 1920x1800+1200+100
		xsetwacom --set "$DEVICE Pen eraser" Area 0 0 94000 60000
		xsetwacom --set "$DEVICE Pen eraser" MapToOutput 1920x1800+1200+100
	else
		xsetwacom --set "$DEVICE Pen stylus" ResetArea
		xsetwacom --set "$DEVICE Pen eraser" ResetArea
		
	fi


else
	echo "just the one"
fi
