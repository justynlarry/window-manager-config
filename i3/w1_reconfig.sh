#!/bin/bash
i3-msg 'workspace 1'

# Left large terminal (Terminal-Main) - takes up full left half
i3-msg '[class="Alacritty" title="Terminal-Main"] floating enable, resize set 1270 1550, move position 0 50'

# Top right: Firefox browser - upper portion of right half
i3-msg '[instance="Navigator" class="firefox"] floating enable, resize set 1280 950, move position 1280 50'

# Bottom right: smaller terminal (Terminal-Side) - lower portion of right half
i3-msg '[class="Alacritty" title="Terminal-Side"] floating enable, resize set 1280 590, move position 1280 1010'

#clear
