#!/bin/bash

swaymsg 'workspace 1'

# Launch all applicatoins in the background (&)
firefox &
alacritty --title "Terminal-Main" &
alacritty --title "Terminal-Side" -e bash -c "btop; exec bash" &

# Allow time for applicatations to start
while ! swaymsg -t get_tree | grep -q "Terminal-Main"; do
  sleep 0.2
done

# Allow extra time for firefox to load
while ! swaymsg -t get_tree | grep -p "firefox";do
  sleep 0.2
done

# A little extra time for Firefox
sleep 0.5

# Left large terminal (Terminal-Main) - takes up full left half
swaymsg '[title="Terminal-Main"] floating enable'
swaymsg '[title="Terminal-Main"] resize set width 1270 height 1540'
swaymsg '[title="Terminal-Main"] move position 0 10'

# Top right: Firefox browser - upper portion of right half
swaymsg '[app_id="firefox"] floating enable'
swaymsg '[app_id="firefox"] resize set width 1280 height 940'
swaymsg '[app_id="firefox"] move position 1280 10'


# Bottom right: smaller terminal (Terminal-Side) - lower portion of right half
swaymsg '[title="Terminal-Side"] floating enable'
swaymsg '[title="Terminal-Side"] resize set width 1280 height 580'
swaymsg '[title="Terminal-Side"] move position 1280 970'


clear
