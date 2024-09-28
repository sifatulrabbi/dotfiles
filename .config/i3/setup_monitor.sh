#!/bin/sh

#PRIMARY="eDP"
PRIMARY="eDP-1-0"
EXTERNAL="DP-1-0"

if xrandr | grep "eDP connected"; then
  PRIMARY="eDP"
elif xrandr | grep "eDP-1-0 connected"; then
  PRIMARY="eDP-1-0"
elif xrandr | grep "eDP-1 connected"; then
  PRIMARY="eDP-1"
elif xrandr | grep "eDP-0 connected"; then
  PRIMARY="eDP-0"
elif xrandr | grep "DP-2 connected"; then
  PRIMARY="DP-2"
fi

if xrandr | grep "DP-1-0 connected"; then
  EXTERNAL="DP-1-0"
elif xrandr | grep "DP-0 connected"; then
  EXTERNAL="DP-0"
fi

xrandr --output "$PRIMARY" --off
xrandr --output "$EXTERNAL" --off

# if xrandr | grep "$EXTERNAL connected"; then
#   echo "Xft.dpi: 93" | xrdb -merge
# else
#   echo "Xft.dpi: 111" | xrdb -merge
# fi

if xrandr | grep "$EXTERNAL connected"; then
  echo "preparing screen: $EXTERNAL"
  # xrandr --output "$EXTERNAL" --mode 1920x1080 --rate 75.00 --scale 1x1 --right-of "$PRIMARY"
  # xrandr --output "$EXTERNAL" --mode 1920x1080 --rate 75.00 --scale 1x1 --same-as "$PRIMARY"
  # xrandr --output "$PRIMARY" --off
  xrandr --output "$EXTERNAL" --mode 1920x1080 --rate 75.00 --scale 1x1
else
  xrandr --output "$PRIMARY" --mode 1920x1080 ---rate 60.00 -scale 1x1
fi

# xrandr --output DP-1-0 --mode 1920x1080 --rate 75.00 --scale 1x1 --right-of eDP
