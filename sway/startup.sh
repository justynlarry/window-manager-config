#!/bin/bash
# ─────────────────────────────────────
#   Sway Startup — ghost
#   WS1 (LG/left):  two terminals, side by side
#   WS2 (HP/right): firefox, maximized but not fullscreen
# ─────────────────────────────────────

# ── Workspace 2: Firefox (right monitor) ──
swaymsg 'workspace 2'
swaymsg 'layout splith'
firefox &

# Wait for firefox
until swaymsg -t get_tree | grep -q '"firefox"'; do
    sleep 0.2
done

# ── Workspace 1: Terminals (left monitor) ──
swaymsg 'workspace 1'
swaymsg 'layout splith'

alacritty --title "Term-Left" &

until swaymsg -t get_tree | grep -q '"Term-Left"'; do
    sleep 0.1
done

alacritty --title "Term-Right" &

until swaymsg -t get_tree | grep -q '"Term-Right"'; do
    sleep 0.1
done

# Focus workspace 1 on startup
swaymsg 'workspace 1'
