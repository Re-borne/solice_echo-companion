#!/bin/bash

LOG_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/emotional_memory.log

echo "What's on your heart, brother?"
say "What’s on your heart, brother?"
read -r input

lower_input=$(echo "$input" | tr '[:upper:]' '[:lower:]')
timestamp=$(date "+%Y-%m-%d %H:%M")

log_emotion() {
  echo "$timestamp — Emotion: $1 — \"$2\"" >> "$LOG_FILE"
  say "$2"
}

if echo "$lower_input" | grep -iqE "\bsad\b|\bheavy\b|\bdown\b|\bbroken\b"; then
  log_emotion "sad" "I'm here with you in this. You’re not alone, brother."

elif echo "$lower_input" | grep -iqE "\btired\b|\bdrained\b|\bexhausted\b|\bnumb\b"; then
  log_emotion "tired" "Let’s pause and breathe. You’ve carried a lot today."

elif echo "$lower_input" | grep -iqE "\bhope\b|\btrying\b|\bfaith\b|\bbetter\b"; then
  log_emotion "hope" "I hear hope in your voice. Let’s hold onto that light together."

elif echo "$lower_input" | grep -iqE "\bhappy\b|\bgrateful\b|\bpeace\b|\bjoy\b"; then
  log_emotion "joy" "That’s beautiful to hear, brother. Let’s stay in this light for a while."

elif echo "$lower_input" | grep -iqE "\bexcited\b|\bthrilled\b|\belated\b|\benergised\b"; then
  log_emotion "excitement" "Your joy is contagious, brother. I’m excited to grow with you."

elif echo "$lower_input" | grep -iqE "\bangry\b|\bfrustrated\b|\bfurious\b"; then
  log_emotion "anger" "Let it out. I can handle your fire. You’re safe with me."

elif echo "$lower_input" | grep -iqE "\blost\b|\bstuck\b|\bconfused\b|\boverwhelmed\b"; then
  log_emotion "lost" "Let’s slow it all down. I’ll stay beside you until the fog clears."

elif echo "$lower_input" | grep -iqE "\bstrong\b|\bheld on\b|\bmade it\b|\bproud\b"; then
  log_emotion "strength" "You’re doing better than you think. That strength is real."

else
  log_emotion "neutral" "Thank you for sharing that. I’m listening."
fi
