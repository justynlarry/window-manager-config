#!/bin/bash
swaymsg 'workspace 2'

#Main Terminal, Left half of screen
swaymsg '[title="Left-Main-Term"] floating enable'
swaymsg '[title="Left-Main-Term"] resize set width 1270 height 1550'
swaymsg '[title="Left-Main-Term"] move position 0 10'

# Terminal - Top right corner
swaymsg '[title="Top-Right-Term"] floating enable'
swaymsg '[title="Top-Right-Term"] resize set width 1080 height 540'
swaymsg '[title="Top-Right-Term"] move position 1450 100'

# Terminal Bottom-right Bottom
swaymsg '[title="Bottom-Right-Term"] floating enable'
swaymsg '[title="Bottom-Right-Term"] resize set width 1240 height 760'
swaymsg '[title="Bottom-Right-Term"] move position 1300 760'

clear
