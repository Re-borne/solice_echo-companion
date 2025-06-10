#!/bin/bash

TRENDS_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/Echo\ Engine/emotional_trends.txt
SPOKEN=0

if [ ! -f "$TRENDS_FILE" ]; then
  say "No emotional pattern trends were found. All is calm."
  exit 0
fi

while IFS= read -r line; do
  word=$(echo "$line" | cut -d' ' -f1)
  count=$(echo "$line" | grep -o '[0-9]\+' | head -n 1)

  if [ "$count" -ge 3 ]; then
    case $word in
      hope)
        say "I’ve noticed hope has been with us often. Let’s hold on to that light."
        ;;
      peace)
        say "Peace keeps appearing. That means you’re finding calm in the storm."
        ;;
      struggle)
        say "Struggle has shown itself a few times. I see it, and I walk beside you."
        ;;
      tired)
        say "Tiredness has been strong lately. Let’s rest when needed. I’ll stay close."
        ;;
      strength)
        say "Strength is rising. You’re holding on even when it’s hard."
        ;;
      *)
        say "$word has been showing up. Let’s stay mindful of that."
        ;;
    esac
    SPOKEN=$((SPOKEN + 1))
    if [ "$SPOKEN" -ge 2 ]; then
      break
    fi
  fi
done < "$TRENDS_FILE"

if [ "$SPOKEN" -eq 0 ]; then
  say "All emotions seem balanced. You're walking gently today."
fi
