#!/usr/bin/env sh

killall -q polybar

export MONITOR1=$(xrandr -q | grep " connected" | cut -d ' ' -f1 | head -n 1)
export MONITOR2=$(xrandr -q | grep " connected" | cut -d ' ' -f1 | sed -n 2p)

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar main &
polybar external &

echo "Bars launched..."
