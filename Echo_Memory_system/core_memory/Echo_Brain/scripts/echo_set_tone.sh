#!/bin/bash

STATE_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/current_state.txt
OVERRIDE_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/tone_override.txt

tone=$1

if [ -z "$tone" ]; then
  say "Please tell me which tone to use: gentle, balanced, or bright."
  exit 1
fi

case $tone in
  gentle|balanced|bright)
    echo "$tone" > "$OVERRIDE_FILE"
    say "Tone override set to $tone. I’ll speak with that spirit now."
    ;;
  clear)
    rm -f "$OVERRIDE_FILE"
    say "Tone override cleared. I’ll return to reflecting your true state."
    ;;
  *)
    say "That’s not a recognised tone. Please choose gentle, balanced, bright, or clear."
    ;;
esac
