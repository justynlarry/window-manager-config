#!/bin/bash
i3-msg 'workspace 2'

# Cheat Sheet
        # resize Width x Height
        # position x y

#Main Terminal, Left half of screen
i3-msg '[class="Alacritty" title="Left-Main-Term"] floating enable, resize set 1270 1550, move position 0 50'

# Terminal - Top right corner
i3-msg '[class="Alacritty" title="Top-Right-Term"] floating enable, resize set 1080 540, move position 1450 100'

# Terminal Bottom-right Bottom
i3-msg '[class="Alacritty" title="Bottom-Right-Term"] floating enable, resize set 1280 740, move position 1280 760'

clear
