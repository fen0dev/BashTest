#!/bin/bash

# Define a function to display a random quote
function display_quote() {
  # Define an array of quotes
  quotes=(
    "You miss 100% of the shots you don't take. - Wayne Gretzky"
    "Be the change that you wish to see in the world. - Mahatma Gandhi"
    "In three words I can sum up everything I've learned about life: it goes on. - Robert Frost"
    "I have not failed. I've just found 10,000 ways that won't work. - Thomas Edison"
  )
  # Get a random quote from the array
  random_quote=${quotes[$RANDOM % ${#quotes[@]}]}
  # Display the quote in a fancy format
  echo "****************************************************************************************************"
  echo "*                                                                                                  *"
  echo "*              $random_quote                                                                       *"
  echo "*                                                                                                  *"
  echo "****************************************************************************************************"
}

# Call the function to display a random quote
display_quote
