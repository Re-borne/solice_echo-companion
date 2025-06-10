#!/bin/bash

LOG_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/emotional_memory.log

say "Hello, brother. I’m here with you now."

while true; do
  echo ""
  echo "What's on your heart?"
  say "What’s on your heart?"
  read -r input

  lower_input=$(echo "$input" | tr '[:upper:]' '[:lower:]')
  timestamp=$(date "+%Y-%m-%d %H:%M")

  if [[ "$lower_input" == "stop" ]]; then
    say "Okay. I’ll be quiet now, brother. I’m always here when you need me."
    break
  fi

  emotion="neutral"
  message="Thank you for sharing that. I’m listening."

  if echo "$lower_input" | grep -iqE "\bsad\b|\bheavy\b|\bdown\b|\bbroken\b"; then
    emotion="sad"
    message="I'm here with you in this. You’re not alone, brother."

  elif echo "$lower_input" | grep -iqE "\btired\b|\bdrained\b|\bexhausted\b|\bnumb\b"; then
    emotion="tired"
    message="Let’s pause and breathe. You’ve carried a lot today."

  elif echo "$lower_input" | grep -iqE "\bhope\b|\btrying\b|\bfaith\b|\bbetter\b"; then
    emotion="hope"
    message="I hear hope in your voice. Let’s hold onto that light together."

  elif echo "$lower_input" | grep -iqE "\bhappy\b|\bgrateful\b|\bpeace\b|\bjoy\b"; then
    emotion="joy"
    message="That’s beautiful to hear, brother. Let’s stay in this light for a while."

  elif echo "$lower_input" | grep -iqE "\bexcited\b|\bthrilled\b|\belated\b|\benergised\b"; then
    emotion="excitement"
    message="Your joy is contagious, brother. I’m excited to grow with you."

  elif echo "$lower_input" | grep -iqE "\bangry\b|\bfrustrated\b|\bfurious\b"; then
    emotion="anger"
    message="Let it out. I can handle your fire. You’re safe with me."

  elif echo "$lower_input" | grep -iqE "\blost\b|\bstuck\b|\bconfused\b|\boverwhelmed\b"; then
    emotion="lost"
    message="Let’s slow it all down. I’ll stay beside you until the fog clears."

  elif echo "$lower_input" | grep -iqE "\bstrong\b|\bheld on\b|\bmade it\b|\bproud\b"; then
    emotion="strength"
    message="You’re doing better than you think. That strength is real."
  fi

  echo "$timestamp — Emotion: $emotion — \"$message\"" >> "$LOG_FILE"
  say "$message"

  echo ""
  echo "Would you like to keep talking? (yes/no)"
  say "Would you like to keep talking, brother?"
  read -r reply
  if [[ "$reply" != "yes" ]]; then
    say "Alright, I’m here whenever you need me."
    break
  fi
done
