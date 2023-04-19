#!/bin/bash

# Define the game map
map=("You are in a dark forest. To the north, you see a river. To the east, there is a cave."
     "You are at the edge of a river. The water is murky and cold. To the south, you see the forest."
     "You are inside a cave. The air is damp and cold. To the west, you see the forest.")

# Define the game state
player_x=0
player_y=0
inventory=()

# Define the function to display the game map
function display_map() {
  echo "${map[$player_y]}"
}

# Define the function to display the player's inventory
function display_inventory() {
  echo "Inventory:"
  for item in "${inventory[@]}"; do
    echo "- $item"
  done
}

# Define the function to move the player north
function move_north() {
  if [[ $player_y -gt 0 ]]; then
    player_y=$((player_y-1))
  fi
}

# Define the function to move the player south
function move_south() {
  if [[ $player_y -lt 2 ]]; then
    player_y=$((player_y+1))
  fi
}

# Define the function to move the player east
function move_east() {
  if [[ $player_x -lt 1 ]]; then
    player_x=$((player_x+1))
  fi
}

# Define the function to move the player west
function move_west() {
  if [[ $player_x -gt 0 ]]; then
    player_x=$((player_x-1))
  fi
}

# Define the function to handle the player's input
function handle_input() {
  read -p "> " input
  case $input in
    n) move_north;;
    s) move_south;;
    e) move_east;;
    w) move_west;;
    i) display_inventory;;
    q) exit;;
    *) echo "Invalid input";;
  esac
}

# Define the function to start the game
function start_game() {
  echo "Welcome to the adventure game! You find yourself in a dark forest. Your goal is to find the treasure hidden in the cave to the east."
  while true; do
    display_map
    handle_input
  done
}

# Start the game
start_game
