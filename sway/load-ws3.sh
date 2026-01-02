#!/bin/bash
swaymsg 'workspace 3'

# Launch Terminals
alacritty --title "WS3-Term" &

while ! swaymsg -t get_tree | grep -q "WS3-Term"; do
  sleep 0.2
done

#Main WorkStation 3 Terminal, Left side of screen
swaymsg '[title="WS3-Term"] floating enable'
swaymsg '[title="WS3-Term"] resize set width 1280 height 500'
swaymsg '[title="WS3-Term"]  move position 0 50'

clear
