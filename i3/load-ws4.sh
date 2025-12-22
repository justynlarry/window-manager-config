#!/bin/bash

i3-msg 'workspace 4'

# Launch VS Code  in Workspace 4
code &
#Wait for it to start:
sleep 2

# Full Screen for this workspace
i3-msg '[class="Code"] floating enable, resize set 2400 1500, move position 80 50'
