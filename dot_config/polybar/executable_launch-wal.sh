#!/usr/bin/env bash

# Colors from pywal
source ~/.cache/wal/colors.sh	

export background=$color0
export foreground=$color7
export foreground_alt=$color7
export primary=$color1
export secondary=$color2
export alert=$color3

export filesystem_label_mounted="%{F$primary}%mountpoint%%{F-} %percentage_used%%"
export network_base_label_disconnected="%{F$primary}%ifname%%{F$disabled} disconnected"
export wlan_label_connected="%{F$primary}%essid%%{F-} %local_ip%"
export eth_label_connected="%{F$primary}%ifname%%{F-} %local_ip%"


# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

CONFIG=$XDG_CONFIG_HOME/polybar/config-wal.ini
# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar.log
polybar -c $CONFIG main 2>&1 | tee -a /tmp/polybar.log & disown
polybar -c $CONFIG secondary 2>&1 | tee -a /tmp/polybar.log & disown
