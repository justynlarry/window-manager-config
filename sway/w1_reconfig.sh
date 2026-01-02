#!/bin/bash

swaymsg 'workspace 1'

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
