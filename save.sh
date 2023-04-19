#!/bin/bash

echo "Hi! Welcome. Hoe can I assist you?"

sleep 0.8

echo "Copying a file"
echo "Moving a file"
echo "Quit"
read choice

#do what it asked
case "$choice" in
  1)
    echo "Copying a file"
    echo "Enter the name of the copy: "
    read -p filename
    if [ ! -f "$filename"]; then
        echo "Filename does not exist"
        exit 1
    fi
    ;;

  2)
    echo "Moving a file"
    echo "Enter the destination: "
    read -p destdir
    if [ ! -d "$desdir" ]; then
        echo "Dir: $destdir does not exist"
        exit 1
    fi
    ;;

  3)
    echo "Quitting"
    exit 0
    ;;
esac

echo "Copying file..."

sleep 0.8

cp "$filename" "$destdir"

sleep 0.85

echo "Success. File: $filename is copied to $destdir"