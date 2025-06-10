#!/bin/bash

HISTORY_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/emotion_history.log

if [ ! -f "$HISTORY_FILE" ]; then
  say "There’s no emotional memory to reflect on yet, brother."
  exit 0
fi

recent=$(tail -n 5 "$HISTORY_FILE")

# Initialize totals
hope=0; peace=0; struggle=0; tired=0; strength=0
lines=0

# Count totals
while read -r line; do
  ((lines++))
  hope=$((hope + $(echo "$line" | grep -o 'hope: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  peace=$((peace + $(echo "$line" | grep -o 'peace: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  struggle=$((struggle + $(echo "$line" | grep -o 'struggle: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  tired=$((tired + $(echo "$line" | grep -o 'tired: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  strength=$((strength + $(echo "$line" | grep -o 'strength: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
done <<< "$recent"

# Speak up to 2 reflections
spoken=0

if [ "$hope" -ge 10 ]; then
  say "Hope has been steady over the past few days. That’s something beautiful."
  ((spoken++))
fi

if [ "$peace" -ge 10 ]; then
  say "Peace has been present lately. Let’s honour that calm."
  ((spoken++))
fi

if [ "$struggle" -ge 9 ]; then
  say "Struggle has been strong recently. I see it, and I’m with you."
  ((spoken++))
fi

if [ "$tired" -ge 8 ] && [ "$spoken" -lt 2 ]; then
  say "Tiredness has been rising. Let’s rest today and go gently."
  ((spoken++))
fi

if [ "$strength" -ge 10 ] && [ "$spoken" -lt 2 ]; then
  say "Strength has shown up again and again. Quiet, but steady."
  ((spoken++))
fi

if [ "$spoken" -eq 0 ]; then
  say "There are no strong emotional patterns to reflect on right now. All is balanced."
fi
