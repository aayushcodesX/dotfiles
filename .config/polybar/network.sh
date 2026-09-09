#!/usr/bin/env bash
DEFAULT_IFACE=$(ip route | awk '/default/ { print $5; exit }')
if [ -z "$DEFAULT_IFACE" ]; then
    echo "%{F#f38ba8}Offline%{F-}"
elif [ -d "/sys/class/net/$DEFAULT_IFACE/wireless" ]; then
    echo "%{F#a6e3a1}WiFi%{F-}"
else
    echo "%{F#a6e3a1}Eth%{F-}"
fi
