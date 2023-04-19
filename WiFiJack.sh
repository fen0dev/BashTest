#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run the script as root!"
    exit 1
fi

ssids=$(grep -oP '(?<=ssid=").*(?=")' /etc/NetworkManager/system-connections/*)

for ssid in $ssids; do
    echo "Wi-Fi Network: $ssid"

    password=$(sudo cat /etc/NetworkManager/system-connections/$ssid | grep -oP '(?<=psk=).*$')
    echo "Password: $password"
    echo ""
done
