
#!/bin/bash

# Initialize game variables
player="X"
score=0
obstacle="O"
coin="$"

# Create game board
board=(
  "##########"
  "#        #"
  "# $      #"
  "#    O   #"
  "#        #"
  "#   X    #"
  "#        #"
  "#        #"
  "#        #"
  "##########"
)

# Function to print the game board
function print_board() {
  clear
  for row in "${board[@]}"; do
    echo "$row"
  done
  echo "Score: $score"
}

# Function to move the player
function move_player() {

  # Get current position of player
  for i in "${!board[@]}"; do
    if [[ "${board[$i]}" == *"$player"* ]]; then
      player_row=$i
      player_col=$(echo "${board[$i]}" | awk -F"$player" '{print length($1)}')
    fi
  done

  # Move player based on user input
  read -n 1 key
  case $key in
    "w")
    
    
      # Move up
      if [[ "${board[$(($player_row - 1))]:$player_col:1}" != "#" ]]; then
        board[$player_row]="${board[$player_row]//$player/ }"
        player_row=$(($player_row - 1))
        if [[ "${board[$player_row]:$player_col:1}" == "$coin" ]]; then
          score=$(($score + 1))
        fi
        
        board[$player_row]="${board[$player_row]:0:$player_col}$player${board[$player_row]:$(($player_col + 1))}"
        
      fi
      ;;
    "a")
    
    
      # Move left
      if [[ "${board[$player_row]:$(($player_col - 1)):1}" != "#" ]]; then
        board[$player_row]="${board[$player_row]//$player/ }"
        player_col=$(($player_col - 1))
        if [[ "${board[$player_row]:$player_col:1}" == "$coin" ]]; then
          score=$(($score + 1))
        fi
        
        board[$player_row]="${board[$player_row]:0:$player_col}$player${board[$player_row]:$(($player_col + 1))}"
        
      fi
      ;;
    "s")
    
    
      # Move down
      if [[ "${board[$(($player_row + 1))]:$player_col:1}" != "#" ]]; then
        board[$player_row]="${board[$player_row]//$player/ }"
        player_row=$(($player_row + 1))
        if [[ "${board[$player_row]:$player_col:1}" == "$coin" ]]; then
          score=$(($score + 1))
        fi
        
        board[$player_row]="${board[$player_row]:0:$player_col}$player${board[$player_row]:$(($player_col + 1))}"
        
      fi
      ;;
    "d")
    
    
      # Move right
      if [[ "${board[$player_row]:$(($player_col + 1)):1}" != "#" ]]; then
        board[$player_row]="${board[$player_row]//$player/ }"
        player_col=$(($player_col + 1))
        if [[ "${board[$player_row]:$player_col:1}" == "$coin" ]]; then
          score=$(($score + 1))
        fi
        
        board[$player_row]
}
