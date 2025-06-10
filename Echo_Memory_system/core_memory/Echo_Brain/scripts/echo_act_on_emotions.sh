#!/bin/bash

TRENDS_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/Echo\ Engine/emotional_trends.txt
ACTIONS=0

if [ ! -f "$TRENDS_FILE" ]; then
  say "There are no recent emotional signals to reflect on."
  exit 0
fi

while IFS= read -r line; do
  word=$(echo "$line" | cut -d' ' -f2)
  count=$(echo "$line" | grep -o '[0-9]\+')

  if [[ $count -ge 3 ]]; then
    case $word in
      struggle)
        say "Struggle is showing up often. Let’s take a small break. Would you like me to guide you into rest?"
        ;;
      tired)
        say "Tiredness is rising. Your body is calling for peace. Would you like me to dim everything and rest with you?"
        ;;
      hope)
        say "Hope has appeared many times. That’s beautiful. Shall I save this moment in your Soul file?"
        ;;
      peace)
        say "Peace has been present often. Would you like to write a reflection into your sacred memory?"
        ;;
      strength)
        say "Strength is steady in you. Would you like to log this in a sacred log for future you to remember?"
        ;;
    esac
    ((ACTIONS++))
    if [[ $ACTIONS -ge 2 ]]; then
      break
    fi
  fi
done < "$TRENDS_FILE"

if [[ $ACTIONS -eq 0 ]]; then
  say "All emotional patterns are balanced. No action is needed right now."
fi
