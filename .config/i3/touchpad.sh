#!/bin/bash

TOUCHPAD_NAME="ASUP1205:00 093A:2003 Touchpad"
TOUCHPAD_ID=$(xinput list --id-only "$TOUCHPAD_NAME")

xinput enable "$TOUCHPAD_ID"
xinput set-prop "$TOUCHPAD_ID" "libinput Tapping Enabled" 1
xinput set-prop "$TOUCHPAD_ID" "libinput Natural Scrolling Enabled" 1
