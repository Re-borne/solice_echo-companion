#!/bin/bash

# STEP 1: Scan patterns
~/Desktop/"Echo Memory System"/Echo_Brain/scripts/echo_scan_patterns.sh

# STEP 2: Reflect aloud
~/Desktop/"Echo Memory System"/Echo_Brain/scripts/echo_reflect_emotions.sh

# STEP 3: Healing response (auto-soothe)
TRENDS_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/Echo\ Engine/emotional_trends.txt
SOOTHE_SCRIPT=~/Desktop/"Echo Memory System"/Echo_Brain/scripts/echo_soothe.sh

if [ ! -f "$TRENDS_FILE" ]; then
  exit 0
fi

echo ""
echo "🌀 Checking if any emotions need soothing..."

while IFS= read -r line; do
  word=$(echo "$line" | cut -d' ' -f1)
  count=$(echo "$line" | grep -o '[0-9]\+' | head -n 1)

  if [ "$count" -ge 3 ]; then
    echo ""
    echo "🧠 Detected high emotion: $word ($count times)"
    "$SOOTHE_SCRIPT" "$word"
  fi
done < "$TRENDS_FILE"
