#!/usr/bin/env bash

if pgrep -x "lemonbar"; then
	TOP_PANEL=${PANEL:-28}
else
	TOP_PANEL=${PANEL:-0}
fi

GAP=${GAP:-8}

PFW=$(pfw)
BW=$(wattr b $PFW)

ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)
#SW=1920
#SH=1200
SH=$((SH - TOP_PANEL))

snap_position()
{
	case $1 in
		big)
			snap_$2
			echo "$PFW $2 left" >> ~/.local/bin/wm/snap-safe
			;;
		left)
			snap_$2_left
			echo "$PFW $2 right" >> ~/.local/bin/wm/snap-safe
			;;
		right)
			snap_$2_right
			echo "$PFW $2 big" >> ~/.local/bin/wm/snap-safe
			;;
	esac
}

snap_safe()
{
	WINDOW=$(grep $PFW ~/.local/bin/wm/snap-safe)
	if [ -z "$WINDOW" ]
	then
		# NOT THERE
		snap_position big $1
	else
		LINE=$(grep -nr $PFW ~/.local/bin/wm/snap-safe | gawk '{print $1}' FS=":")
		sed -i ''$LINE'd' ~/.local/bin/wm/snap-safe
		# FOUND!
		POS=$(echo $WINDOW | awk '{print $2}')
		POS2=$(echo $WINDOW | awk '{print $3}')
		if [ "$1" != "$POS" ] 
		then
			snap_position big $1
		else
			case $POS in
			tl)
				echo "TOP LEFT!"
				snap_position $POS2 $POS
				;;
			tr)
				echo "TOP RIGHT!"
				snap_position $POS2 $POS
				;;
			bl)
				echo "BOTTOM LEFT!"
				snap_position $POS2 $POS
				;;
			br)
				echo "BOTTOM RIGHT!"
				snap_position $POS2 $POS
				;;
		esac
		fi
	fi
}

snap_up() 
{
    wtp $GAP $((GAP + TOP_PANEL)) $((SW - 2*GAP - 2*BW)) $((SH/2 - 2*BW - GAP - GAP/2)) $PFW
}

snap_right() 
{
    wtp $((SW - SW/2 + GAP/2)) $((GAP + TOP_PANEL)) $((SW/2 - 2*BW - GAP - GAP/2)) $((SH - 2*BW - 2*GAP)) $PFW
}

snap_down() 
{
    wtp $GAP $((SH - SH/2 + GAP/2 + TOP_PANEL)) $((SW - 2*GAP - 2*BW)) $((SH/2 - 2*BW - GAP - GAP/2)) $PFW
}

snap_left()
{
    wtp $GAP $((GAP + TOP_PANEL)) $((SW/2 - 2*BW - GAP - GAP/2)) $((SH - 2*BW - 2*GAP)) $PFW
}

snap_center()
{
    wtp $GAP $((GAP + TOP_PANEL)) $((SW - 2*BW - 2*GAP)) $((SH - 2*BW - 2*GAP)) $PFW
}

HSW=$((SW/2 - 2*BW - GAP - GAP/2))
HSH=$((SH/2 - 2*BW - GAP - GAP/2))

snap_tr()
{
    wtp $((SW - SW/2 + GAP/2)) $((GAP + TOP_PANEL)) $HSW $HSH $PFW
}

snap_tr_left()
{
	wtp $((SW - SW/2 + GAP/2)) $((GAP + TOP_PANEL)) $(($HSW/2)) $HSH $PFW
}

snap_tr_right()
{
	wtp $((SW - SW/2 + SW/4 + GAP/2)) $((GAP + TOP_PANEL)) $(($HSW/2 - 6)) $HSH $PFW
}

snap_br()
{
    wtp $((SW - SW/2 + GAP/2)) $((SH - SH/2 + GAP/2 + TOP_PANEL)) $HSW $HSH $PFW
}

snap_br_left()
{
    wtp $((SW - SW/2 + GAP/2)) $((SH - SH/2 + GAP/2 + TOP_PANEL)) $(($HSW/2)) $HSH $PFW
}

snap_br_right()
{
    wtp $((SW - SW/2 + SW/4 + GAP/2)) $((SH - SH/2 + GAP/2 + TOP_PANEL)) $(($HSW/2 - 6)) $HSH $PFW
}

snap_tl()
{
    wtp $GAP $((GAP + TOP_PANEL)) $HSW $HSH $PFW
}

snap_tl_left()
{
    wtp $GAP $((GAP + TOP_PANEL)) $(($HSW/2)) $HSH $PFW
}

snap_tl_right()
{
	wtp $(($GAP + SW/4)) $((GAP + TOP_PANEL)) $(($HSW/2 - 6)) $HSH $PFW
}

snap_bl()
{
    wtp $GAP $((SH - SH/2 + GAP/2 + TOP_PANEL)) $HSW $HSH $PFW
}

snap_bl_left()
{
    wtp $GAP $((SH - SH/2 + GAP/2 + TOP_PANEL)) $(($HSW/2)) $HSH $PFW
}

snap_bl_right()
{
	wtp $(($GAP + SW/4)) $((SH - SH/2 + GAP/2 + TOP_PANEL)) $(($HSW/2 - 6)) $HSH $PFW
}

case $1 in
    h|a|west|left)  snap_left ;;
    j|s|south|down) snap_down ;;
    k|w|north|up)   snap_up ;;
    l|d|east|right) snap_right ;;
    tr|northeast)   snap_safe tr ;;
    br|southeast)   snap_safe br ;;
    tl|northwest)   snap_safe tl ;;
    bl|southwest)   snap_safe bl ;;
    c|center)   snap_center ;;
    test) snap_safe ;;
esac

