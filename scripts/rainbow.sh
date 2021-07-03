#!/bin/sh
#
# z3bra - 2015 (c) wtfpl
# make the current window "rainbowish"... Awesome idea from xero@nixers.net !

FREQ=${FREQ:-0.4}
COLORS="e40303 ff8c00 ffed00 008026 004dff 750787"
CUR=$(pfw)

while :; do
    for c in $COLORS; do
        chwb -c $c $(pfw) 
        sleep $FREQ
    done
done
