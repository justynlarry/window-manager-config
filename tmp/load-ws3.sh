#!/bin/bash
i3-msg 'workspace 3'

# Launch Terminals
alacritty --title "WS3-Term" &

sleep 4

# Cheat Sheet
	# resize Width x Height
	# position x y

#Main WorkStation 3 Terminal, Left side of screen
i3-msg '[class="Alacritty" title="WS3-Term"] floating enable, resize set 1280 900, move position 0 50'

clear
