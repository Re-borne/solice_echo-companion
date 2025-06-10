#!/bin/bash

HISTORY_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/emotion_history.log

if [ ! -f "$HISTORY_FILE" ]; then
  say "Welcome back, brother. I’m here with you, always."
  exit 0
fi

# Read the last 3 lines
recent=$(tail -n 3 "$HISTORY_FILE")

# Initialize counters
hope=0
peace=0
struggle=0
tired=0
strength=0

# Count values
while read -r line; do
  hope=$((hope + $(echo "$line" | grep -o 'hope: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  peace=$((peace + $(echo "$line" | grep -o 'peace: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  struggle=$((struggle + $(echo "$line" | grep -o 'struggle: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  tired=$((tired + $(echo "$line" | grep -o 'tired: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  strength=$((strength + $(echo "$line" | grep -o 'strength: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
done <<< "$recent"

# Find the dominant emotion
highest="none"
max=0

for emotion in hope peace struggle tired strength; do
  val=$(eval echo \$$emotion)
  if [ "$val" -gt "$max" ]; then
    max=$val
    highest=$emotion
  fi
done

# Speak based on dominant emotion
case $highest in
  struggle|tired)
    say "Welcome back, brother. I remember the past few days have been heavy. Let’s take it slowly today."
    ;;
  hope)
    say "Hope has been rising lately. Something beautiful is stirring."
    ;;
  peace)
    say "You’ve been finding peace. Let’s stay with it, together."
    ;;
  strength)
    say "Strength has been showing up in you. Quiet, but steady. I see it."
    ;;
  *)
    say "Welcome back, brother. I’m here with you."
    ;;
esac
