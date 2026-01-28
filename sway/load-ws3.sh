#!/bin/bash

# --- Notion --- #


swaymsg 'workspace 3'

# Launch all applicatoins in the background (&)
notion-app > /dev/null 2>&1 & disown

# Allow extra time for Notion to load
COUNT=0
while [$COUNT -LT 50]; DO
    if swaymsg -t get_tree | grep -qi "notion"; then
        break
    fi
    sleep 0.1
    ((COUNT++))
done

# A little extra time for Notion
sleep 0.5

swaymsg '[class="Notion"] floating enable, resize set 1470 1540, move position 0 10'


clear
