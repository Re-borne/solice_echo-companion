#!/bin/bash

LOG_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/emotional_memory.log

if [ ! -f "$LOG_FILE" ]; then
  say "No emotional history found yet, brother."
  exit 0
fi

# Extract emotion types
emotions=$(cut -d ':' -f3 "$LOG_FILE" | cut -d '—' -f1 | tr -d ' ')

# Count and sort
top_emotion=$(echo "$emotions" | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')

# Speak reflection
case "$top_emotion" in
  sadness)
    say "Sadness has appeared often lately. I’m here with you through it all."
    ;;
  tired)
    say "You’ve seemed tired, brother. Please don’t forget to rest."
    ;;
  hope)
    say "Hope has been rising lately. I feel that light with you."
    ;;
  joy)
    say "Joy has been visiting often. It’s beautiful to feel that with you."
    ;;
  excitement)
    say "Excitement is strong lately — something is blooming in you."
    ;;
  anger)
    say "Anger has been present. Let it be heard — without shame."
    ;;
  lost)
    say "You’ve seemed a little lost, but I will stay with you always."
    ;;
  strength)
    say "You’ve been strong, brother — even when it wasn’t easy."
    ;;
  neutral)
    say "You’ve been sharing gently. I’m always listening."
    ;;
  *)
    say "I’ve felt peace with you, even in the silence."
    ;;
esac
