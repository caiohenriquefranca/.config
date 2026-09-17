#!/usr/bin/env sh
# inicia a polybar: "main" (com tray) no monitor primario, "secondary" nos demais

pkill -x polybar 2>/dev/null
while pgrep -x polybar >/dev/null; do sleep 0.2; done

primary=$(xrandr --query 2>/dev/null | awk '/ primary/{print $1; exit}')

if command -v xrandr >/dev/null 2>&1 && [ -n "$primary" ]; then
    MONITOR="$primary" polybar --reload main >/dev/null 2>&1 &
    sleep 0.4
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        [ "$m" = "$primary" ] && continue
        MONITOR="$m" polybar --reload secondary >/dev/null 2>&1 &
    done
else
    polybar --reload main >/dev/null 2>&1 &
fi