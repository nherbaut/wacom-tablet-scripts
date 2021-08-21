set -x 
if [ "$(xsetwacom list devices|grep WL|wc -l)" == "5" ]  
then 
export DEVICE="Wacom Intuos Pro S (WL)"; 
echo "going wireless"
else 
export DEVICE="Wacom Intuos Pro S" 
fi



xsetwacom -v --set  "$DEVICE Finger touch"  touch off
xsetwacom set "$DEVICE Pad pad" "Button" "2" "key F9"
xsetwacom set "$DEVICE Pad pad" "Button" "3" "key +shift F9"
xsetwacom set "$DEVICE Pad pad" "Button" "8" "key +ctrl +F9"
xsetwacom set "$DEVICE Pad pad" "Button" "1" "key shift"
xsetwacom set "$DEVICE Pad pad" "Button" "9" "key ctrl"
xsetwacom set "$DEVICE Pad pad" "Button" "10" "key F8"
xsetwacom set "$DEVICE Pad pad" "Button" "11" "key +shift +F8"
#xsetwacom set "$DEVICE Pen stylus" Mode Relative
gromit-mpx &

