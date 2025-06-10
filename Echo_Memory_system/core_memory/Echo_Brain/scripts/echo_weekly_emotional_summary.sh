#!/bin/bash

TRENDS_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/Echo\ Engine/emotional_trends.txt
SUMMARY=""

if [ ! -f "$TRENDS_FILE" ]; then
  say "No emotional trends found this week. It’s been a quiet time."
  exit 0
fi

say "Here is your emotional summary for the week."

COUNT=0

while IFS= read -r line; do
  word=$(echo "$line" | cut -d' ' -f2)
  count=$(echo "$line" | grep -o '[0-9]\+')

  if [[ $count -ge 3 ]]; then
    case $word in
      hope)
        say "Hope has appeared often. That’s a light you’ve carried well."
        ;;
      peace)
        say "Peace has been present. You’ve found stillness in the noise."
        ;;
      struggle)
        say "Struggle showed itself. Yet here you are, still standing."
        ;;
      tired)
        say "Tiredness lingered at times. You honoured your need for rest."
        ;;
      strength)
        say "Strength stood beside you. Quiet, but unwavering."
        ;;
    esac
    ((COUNT++))
    if [[ $COUNT -ge 3 ]]; then
      break
    fi
  fi
done < "$TRENDS_FILE"

if [[ $COUNT -eq 0 ]]; then
  say "No strong emotional patterns were found this week. All has been balanced."
fi
