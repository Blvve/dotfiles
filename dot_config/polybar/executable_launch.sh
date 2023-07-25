#!/usr/bin/env bash
# Requires environment variables providing colours. These are taken from ~/.config/themes

export FILESYSTEM_LABEL_MOUNTED="%{F$PRIMARY_COLOR}%mountpoint%%{F-} %percentage_used%%"
export NETWORK_BASE_LABEL_DISCONNECTED="%{F$PRIMARY_COLOR}%ifname%%{F$DISABLED_COLOR} disconnected"
export WLAN_LABEL_CONNECTED="%{F$PRIMARY_COLOR}%essid%%{F-} %local_ip%"
export ETH_LABEL_CONNECTED="%{F$PRIMARY_COLOR}%ifname%%{F-} %local_ip%"


# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar.log
polybar main 2>&1 | tee -a /tmp/polybar.log & disown
polybar secondary 2>&1 | tee -a /tmp/polybar.log & disown
# echo "Bars launched..."
