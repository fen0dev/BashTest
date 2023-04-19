#!/bin/bash

# Welcome message
echo "Welcome to the best Bash script!"

# Get user input
echo -n "Please enter your name: "
read NAME

# Greet the user
echo "Hello, $NAME!"

# Display current date and time
echo "The current date and time is: $(date)"

# Get system information
echo "System information:"
echo "Kernel version: $(uname -r)"
echo "Operating system: $(lsb_release -d | cut -d: -f2 | sed 's/^[ \t]*//')"
echo "CPU info: $(lscpu | grep 'Model name' | cut -d: -f2 | sed 's/^[ \t]*//')"
echo "Memory info: $(free -h | grep 'Mem' | awk '{print "Total: " $2 " Used: " $3 " Free: " $4}')"

# Check internet connection
echo "Checking internet connection..."
ping -q -c5 google.com > /dev/null
if [ $? -eq 0 ]; then
    echo "Internet connection is up."
else
    echo "Internet connection is down."
fi

# Display disk usage information
echo "Disk usage information:"
df -h | awk '$NF=="/"{printf "Total: %d GB\nUsed: %d GB\nFree: %d GB\n", $2/1024/1024, $3/1024/1024, $4/1024/1024}'

# Check for updates and install them
echo "Checking for updates..."
sudo apt update > /dev/null
if [ $(sudo apt list --upgradable | wc -l) -gt 1 ]; then
    echo "Updates are available. Installing them now..."
    sudo apt upgrade -y > /dev/null
    echo "Updates installed successfully."
else
    echo "No updates available."
fi

# Goodbye message
echo "Thanks for using the best Bash script! Goodbye, $NAME!"

