#!/bin/sh

BAT_FILE=/sys/class/power_supply/CMB0/uevent

WARNING_TEXT="The battery is critically low. This computer will hibernate unless it is plugged in."

# Use xpub to get env variables for notifications
export $(/usr/bin/xpub)

# setting the delay to 175 or more seems to break things, and the computer will not hibernate!!!
for t in {170..0}
do
	M=$((t/60)) # minutes
	S=$((t%60)) # seconds
	export MESSAGE=${WARNING_TEXT}\ \(${M}m\ ${S}s\)
	/bin/su "${XUSER}" -c '/usr/bin/dunstify -u critical -t 1500 -a "lowBat" -h string:x-dunst-stack-tag:"lowBat" "Battery low" "$MESSAGE"'
	sleep 1s
	if /usr/bin/grep -q "Charging" "$BAT_FILE"; then
		exit 0
	fi
done

/usr/bin/systemctl hibernate


