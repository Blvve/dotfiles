if [[ $1 == 1 ]]; then
	matrix="0 -1 1 1 0 0 0 0 1"
	orientation="left"
else
	matrix="0 0 0 0 0 0 0 0 0"
	orientation="normal"
fi	

devices=('Wacom Pen and multitouch sensor Pen stylus' 'Wacom Pen and multitouch sensor Finger touch' 'Wacom Pen and multitouch sensor Pen eraser' 'Elan Touchpad')

for device in "${devices[@]}"; do
	xinput set-prop "$device" --type=float "Coordinate Transformation Matrix"  $matrix
done

xrandr -o $orientation 
wal -R -e && $HOME/scripts/wal-reload.sh
