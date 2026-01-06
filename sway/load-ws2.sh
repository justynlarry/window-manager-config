#!/bin/bash
swaymsg 'workspace 2'

# Launch Terminals
alacritty --title "Left-Main-Term" &
alacritty --title "Top-Right-Term" -e bash -c "screenfetch -c 39,7; exec bash" &
# Blood-Red Arch Logo
#alacritty --title "Top-Right-Term" -e bash -c "screenfetch -c 88,7; exec bash" &
alacritty --title "Bottom-Right-Term" -e bash -c "unimatrix -s 94 -c blue -l k; exec bash" &

while ! swaymsg -t get_tree | grep -q "Left-Main-Term"; do
  sleep 0.2
done

#Main Terminal, Left half of screen
swaymsg '[title="Left-Main-Term"] floating enable'
swaymsg '[title="Left-Main-Term"] resize set width 1270 height 1540'
swaymsg '[title="Left-Main-Term"] move position 0 10'

# Terminal - Top right corner
swaymsg '[title="Top-Right-Term"] floating enable'
swaymsg '[title="Top-Right-Term"] resize set width 830 height 540'
swaymsg '[title="Top-Right-Term"] move position 1310 50'

# Terminal Bottom-right Bottom
swaymsg '[title="Bottom-Right-Term"] floating enable'
swaymsg '[title="Bottom-Right-Term"] resize set width 1240 height 760'
swaymsg '[title="Bottom-Right-Term"] move position 1300 760'

clear
