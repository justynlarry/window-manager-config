#!/bin/bash

# Run Startup script for Workspace 3
/home/larryman/.config/sway/load-ws3.sh
sleep 2

# Run Startup script for Workspace 2
/home/larryman/.config/sway/load-ws2.sh
# Wait for Workspace 2 to load
sleep 2

# Run Startup script for Workspace 1
/home/larryman/.config/sway/load-ws1.sh
# Wait for Workspace 1 to load
sleep 3

