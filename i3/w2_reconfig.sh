#!/bin/bash
i3-msg 'workspace 2'

# Cheat Sheet
        # resize Width x Height
        # position x y

#Main Terminal, Left half of screen
i3-msg '[class="Alacritty" title="Left-Main-Term"] floating enable, resize set 1270 1550, move position 0 50'

# Terminal - Top right corner
i3-msg '[class="Alacritty" title="Top-Right-Term"] floating enable, resize set 1280 740, move position 1280 50'

# Terminal Leftmost-Bottom Right
i3-msg '[class="Alacritty" title="Left-Bottom-Right"] floating enable, resize set 400 800, move position 1280 800'

# Terminal Bottom-right Top
i3-msg '[class="Alacritty" title="Bottom-Right-Top"] floating enable, resize set 870 230, move position 1690 800'

# Terminal Bottom-right Bottom
i3-msg '[class="Alacritty" title="Bottom-Right-Bottom"] floating enable, resize set 870 560, move position 1690 1040'

clear
