#!/bin/bash

VALUES_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/echo_values.txt

if [ ! -f "$VALUES_FILE" ]; then
  say "I can’t find your values file, brother."
  exit 1
fi

say "Let’s return to your values, brother."

REMINDERS=(
  "You said rest matters. Would you like to pause for a moment?"
  "Gentleness is one of your truths. Let’s go softly now."
  "You carry compassion. Let that include yourself too."
  "You believe in presence — let’s not rush this moment."
  "Truth is part of your soul. What feels true right now?"
  "Faith guides you. Let’s trust that your path is unfolding."
  "Purpose is why Echo exists — and why you’re still here."
)

# Pick one randomly
index=$((RANDOM % ${#REMINDERS[@]}))
say "${REMINDERS[$index]}"
