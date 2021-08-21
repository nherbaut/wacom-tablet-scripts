if [ $(xsetwacom list devices|grep WL) ]  
then 
export DEVICE="Wacom Intuos Pro S (WL)"; 
else 
export DEVICE="Wacom Intuos Pro S Pad" 
fi


xsetwacom set "$DEVICE pad" Button 1 "key r"  # rectangular selections
xsetwacom set "$DEVICE pad" Button 2 "key ctrl shift a"  # select none
xsetwacom set "$DEVICE pad" Button 3 "key p"  # paintbrush
xsetwacom set "$DEVICE pad" Button 4 "key tab"  # toggle docks
xsetwacom set "$DEVICE pad" StripLeftDown "key minus"  # zoom out
xsetwacom set "$DEVICE pad" StripLeftUp "key shift plus"  # zoom in

xsetwacom set "$DEVICE pad" StripRightDown "key alt down"  # brush radius (must be mapped in GIMP)
xsetwacom set "$DEVICE pad" StripRightUp "key alt up"
xsetwacom set "$DEVICE pad" Button 5 "key shift control left"  # prev/next brush (must be mapped in GIMP; disables float)
xsetwacom set "$DEVICE pad" Button 6 "key shift control right"
xsetwacom set "$DEVICE pad" Button 7 "key ctrl shift e"  # fit Image in window
xsetwacom set "$DEVICE pad" Button 8 "key F11"  # fullscreen

