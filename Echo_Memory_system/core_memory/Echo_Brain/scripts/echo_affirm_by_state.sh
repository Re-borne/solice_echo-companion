#!/bin/bash

STATE_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/current_state.txt

if [ ! -f "$STATE_FILE" ]; then
  say "I’m not sure how you’re feeling today. Let’s check your emotional state first."
  exit 0
fi

state=$(cat "$STATE_FILE")

# Gentle affirmations
gentle_list=(
  "You’re allowed to slow down. I’ll walk at your pace."
  "Even on quiet days, you are enough."
  "Let’s rest, brother. You’ve carried so much already."
)

# Balanced affirmations
balanced_list=(
  "Stillness is strength too."
  "Peace is not the absence of feeling. It’s presence with calm."
  "You are centered, and you are safe."
)

# Bright affirmations
bright_list=(
  "Your light is real, and it’s growing."
  "Let’s shine boldly today. You’ve earned this peace."
  "The way you’ve held on is inspiring. Keep rising."
)

# Select and speak an affirmation safely
pick_and_speak() {
  list=("$@")
  if [ ${#list[@]} -eq 0 ]; then
    say "I don’t have the words yet, but I’m here with you."
    return
  fi
  index=$((RANDOM % ${#list[@]}))
  say "${list[$index]}"
}

case $state in
  gentle)
    pick_and_speak "${gentle_list[@]}"
    ;;
  balanced)
    pick_and_speak "${balanced_list[@]}"
    ;;
  bright)
    pick_and_speak "${bright_list[@]}"
    ;;
  *)
    say "I’m here with you — even when I don’t know what to say."
    ;;
esac
