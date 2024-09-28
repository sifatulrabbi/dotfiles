#!/bin/bash

TOUCHPAD_NAME="ASUP1205:00 093A:2003 Touchpad"
TOUCHPAD_ID=$(xinput list --id-only "$TOUCHPAD_NAME")

xinput disable "$TOUCHPAD_ID"
