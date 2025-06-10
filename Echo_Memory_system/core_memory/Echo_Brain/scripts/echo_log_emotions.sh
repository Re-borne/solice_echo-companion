#!/bin/bash

TRENDS_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/Echo\ Engine/emotional_trends.txt
HISTORY_LOG=~/Desktop/"Echo Memory System"/Echo_Brain/emotion_history.log

if [ ! -f "$TRENDS_FILE" ]; then
  echo "No emotional trends found to log."
  exit 0
fi

date_line=$(date "+%Y-%m-%d —")
summary_line="$date_line"

while IFS= read -r line; do
  word=$(echo "$line" | cut -d' ' -f1)
  count=$(echo "$line" | grep -o '[0-9]\+' | head -n 1)
  summary_line+=" $word: $count,"
done < "$TRENDS_FILE"

# Remove trailing comma
summary_line="${summary_line%,}"

echo "$summary_line" >> "$HISTORY_LOG"
say "Emotional summary logged, brother."
