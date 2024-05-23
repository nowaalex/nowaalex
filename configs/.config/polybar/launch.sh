#!/usr/bin/env bash
polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar-mainbar.log
polybar mainbar 2>&1 | tee -a /tmp/polybar-mainbar.log & disown
echo "Bars launched..."

