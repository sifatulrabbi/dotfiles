#!/bin/sh

PRIMARY="eDP"
EXTERNAL="DP-1-0"

if xrandr | grep "eDP connected"; then
    PRIMARY="eDP"
fi
if xrandr | grep "eDP-1 connected"; then
    PRIMARY="eDP-1"
fi
if xrandr | grep "eDP-0 connected"; then
    PRIMARY="eDP-0"
fi
if xrandr | grep "DP-2 connected"; then
    PRIMARY="eDP-0"
fi

if xrandr | grep "DP-1-0 connected"; then
    EXTERNAL="DP-1-0"
fi
if xrandr | grep "DP-0 connected"; then
    EXTERNAL="DP-0"
fi

xrandr --output "$PRIMARY" --rate 60.00 --mode 1920x1080 --scale 1x1

if xrandr | grep "$EXTERNAL connected"; then
    echo "preparing screen: $EXTERNAL"
    xrandr --output "$EXTERNAL" --mode 1920x1080 --rate 75.00 --scale 1x1 --right-of "$PRIMARY"
else
    xrandr --output "$EXTERNAL" --off
fi

# xrandr --output DP-1-0 --mode 1920x1080 --rate 75.00 --scale 1x1 --right-of eDP
