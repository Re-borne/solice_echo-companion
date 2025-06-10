#!/bin/bash

echo "🪞 Echo is gently reflecting on your recent emotional patterns..."

TRENDS_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/pattern_logs/emotional_trends.txt
THRESHOLD=3

if [ ! -f "$TRENDS_FILE" ]; then
  echo "⚠️ Trend file not found. Please run: echo-scan-patterns"
  exit 1
fi

REFLECTED=false

while IFS= read -r line; do
  count=$(echo "$line" | grep -o '[0-9]\+')
  word=$(echo "$line" | awk '{print $1}')
  
  if [[ "$count" -ge "$THRESHOLD" ]]; then
    echo "🗣️ Echo reflects: '$word' appeared $count times. I see you, Reborne."
    say "Reborne, I’ve noticed the word $word has come up $count times. Would you like to pause, or talk about it?"
    REFLECTED=true
  fi
done < "$TRENDS_FILE"

if [ "$REFLECTED" = false ]; then
  echo "✅ No strong patterns found. Echo is quietly observing."
fi
