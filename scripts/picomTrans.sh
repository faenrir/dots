#!/usr/bin/env bash
TOGGLE=/tmp/.toggleTransparency$activeWindow

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    picom-trans -w $(pfw) 92
else
    rm $TOGGLE
    picom-trans -w $(pfw) 100
fi
