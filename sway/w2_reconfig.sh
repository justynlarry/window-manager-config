#!/bin/bash
swaymsg 'workspace 2'

#Main Terminal, Left half of screen
swaymsg '[title="Left-Main-Term"] floating enable'
swaymsg '[title="Left-Main-Term"] resize set width 1230 height 1540'
swaymsg '[title="Left-Main-Term"] move position 0 10'

# Terminal - Top right corner
swaymsg '[title="Top-Right-Term"] floating enable'
swaymsg '[title="Top-Right-Term"] resize set width 910 height 540'
swaymsg '[title="Top-Right-Term"] move position 1250 70'

# Terminal Bottom-right Bottom
swaymsg '[title="Bottom-Right-Term"] floating enable'
swaymsg '[title="Bottom-Right-Term"] resize set width 1260 height 810'
swaymsg '[title="Bottom-Right-Term"] move position 1270 710'

clear
