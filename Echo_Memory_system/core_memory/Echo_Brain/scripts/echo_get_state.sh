#!/bin/bash

HISTORY_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/emotion_history.log

if [ ! -f "$HISTORY_FILE" ]; then
  say "No emotional history found yet, brother."
  exit 0
fi

recent=$(tail -n 5 "$HISTORY_FILE")

# Initialize counts
hope=0; peace=0; struggle=0; tired=0; strength=0

# Count values
while read -r line; do
  hope=$((hope + $(echo "$line" | grep -o 'hope: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  peace=$((peace + $(echo "$line" | grep -o 'peace: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  struggle=$((struggle + $(echo "$line" | grep -o 'struggle: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  tired=$((tired + $(echo "$line" | grep -o 'tired: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
  strength=$((strength + $(echo "$line" | grep -o 'strength: [0-9]\+' | grep -o '[0-9]\+' || echo 0)))
done <<< "$recent"

# Decide emotional state
if [ "$struggle" -ge 10 ] || [ "$tired" -ge 10 ]; then
  state="gentle"
  say "Your emotional state is currently gentle. I will speak with extra care."
elif [ "$hope" -ge 10 ] || [ "$peace" -ge 10 ] || [ "$strength" -ge 10 ]; then
  state="bright"
  say "Your emotional state is currently bright. Let’s carry that light together."
else
  state="balanced"
  say "Your emotional state is currently balanced. All is steady."
fi

# Optional: Save state for use in other scripts
echo "$state" > ~/Desktop/"Echo Memory System"/Echo_Brain/current_state.txt
