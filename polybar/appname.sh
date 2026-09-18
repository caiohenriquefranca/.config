#!/usr/bin/env sh
# Mostra apenas o nome do aplicativo da janela focada (ex: firefox, alacritty)

wid=$(xdotool getactivewindow 2>/dev/null) || exit 0
wmclass=$(xprop -id "$wid" WM_CLASS 2>/dev/null) || exit 0

name=$(echo "$wmclass" | sed -n 's/.*= "[^"]*", "\([^"]*\)".*/\1/p')
[ -z "$name" ] && exit 0

name=$(echo "$name" | tr '[:upper:]' '[:lower:]')
max=20

[ "${#name}" -gt "$max" ] && name="$(echo "$name" | cut -c1-"$max")…"
echo "$name"