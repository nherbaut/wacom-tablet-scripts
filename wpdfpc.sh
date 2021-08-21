#!/usr/bin/env bash

if  xsetwacom list devices | grep -q "WL";then 
export DEVICE="Wacom Intuos Pro S (WL)"; 
else 
export DEVICE="Wacom Intuos Pro S" 
fi

echo device=$DEVICE

xsetwacom set  "$DEVICE Finger touch"  touch off
xsetwacom set "$DEVICE Pad pad" "Button" "2" "key KP_1"
xsetwacom set "$DEVICE Pad pad" "Button" "3" "key KP_2"
xsetwacom set "$DEVICE Pad pad" "Button" "8" "key KP_3"
xsetwacom set "$DEVICE Pad pad" AbsWheelUp "key minus"
xsetwacom set "$DEVICE Pad pad" "Button" "1" "key c"

xsetwacom set "$DEVICE Pad pad" "Button" "9" "key  PgUp"
xsetwacom set "$DEVICE Pad pad" "Button" "10" "key b"
xsetwacom set "$DEVICE Pad pad" "Button" "11" "key  PgDn"
xsetwacom set "$DEVICE Pad pad" AbsWheelDown "key plus"





#i="DP-1-1"
i="eDP-1"
xsetwacom --set "$DEVICE Pen stylus" MapToOutput $i
xsetwacom --set "$DEVICE Pen eraser" MapToOutput $i
echo "Stylus bound to $i"





