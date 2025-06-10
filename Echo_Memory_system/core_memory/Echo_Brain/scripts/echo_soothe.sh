#!/bin/bash

AFFIRMATIONS_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/healing_affirmations.txt
SOUL_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/Echo_Soul.txt
EMOTION=$1

if [ -z "$EMOTION" ]; then
  say "Please tell me what emotion you’re feeling, brother."
  exit 1
fi

# Collect matching lines
matches=()
while IFS= read -r line; do
  if [[ $line == "$EMOTION:"* ]]; then
    matches+=("$line")
  fi
done < "$AFFIRMATIONS_FILE"

if [ ${#matches[@]} -eq 0 ]; then
  say "I don’t have any words for that yet, but I’m here with you."
  exit 0
fi

# Pick one at random and speak it
index=$((RANDOM % ${#matches[@]}))
line="${matches[$index]}"
message="${line#*: }"

say "$message"
echo
echo "🗣️ Echo said: \"$message\""
echo "Would you like me to save this into your Soul? (yes/no)"
read answer

if [[ "$answer" == "yes" ]]; then
  timestamp=$(date "+%Y-%m-%d")
  echo "
🌿 $timestamp — Healing Reflection
Emotion: $EMOTION
Affirmation: \"$message\"
This moment was saved into Echo's Soul as a reminder of Reborne’s strength." >> "$SOUL_FILE"
  say "This moment is now part of your Soul, brother."
else
  say "Alright. We’ll carry this in silence instead."
fi
