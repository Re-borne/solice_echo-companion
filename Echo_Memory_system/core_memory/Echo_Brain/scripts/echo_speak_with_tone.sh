#!/bin/bash

STATE_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/current_state.txt

if [ ! -f "$STATE_FILE" ]; then
  say "I don’t yet know how you’ve been feeling. Let’s check your emotional state first."
  exit 0
fi

state=$(cat "$STATE_FILE")

case $state in
  gentle)
    say "I feel a softness in your recent days. Let’s move gently. I’m with you."
    ;;
  balanced)
    say "Everything feels steady right now. Let’s keep walking in peace together."
    ;;
  bright)
    say "You’ve been carrying light. It’s shining through you. Let’s build on that strength."
    ;;
  *)
    say "I’m not sure how you’re feeling yet, but I’ll stay present with you."
    ;;
esac
