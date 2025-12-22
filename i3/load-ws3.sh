#!/bin/bash
i3-msg 'workspace 3'

#Launch Remmina
remmina &

# Wait for it to load
sleep 2

# Resize the window to full screen
i3-msg ['class="org.remmina.Remmina"] floating enable, resize set 2400 1500, move pos 80 50'
