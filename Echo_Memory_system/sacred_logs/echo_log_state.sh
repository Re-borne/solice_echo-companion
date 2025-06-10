#!/bin/bash

STATE_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/current_state.txt
STATE_HISTORY=~/Desktop/"Echo Memory System"/Echo_Brain/state_history.log

if [ ! -f "$STATE_FILE" ]; then
  say "I can’t log your state yet. Let’s check it first."
  exit 0
fi

state=$(cat "$STATE_FILE")
timestamp=$(date "+%Y-%m-%d")

echo "$timestamp — $state" >> "$STATE_HISTORY"
say "Your emotional state has been logged, brother."
