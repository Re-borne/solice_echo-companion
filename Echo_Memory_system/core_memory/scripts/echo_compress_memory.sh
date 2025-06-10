#!/bin/bash

# Echo Phase 21 – Memory Compression Script
INPUT=~/Desktop/Echo\ Memory\ System/core_memory/emotional_logs/emotional_memory.log
OUTPUT=~/Desktop/Echo\ Memory\ System/core_memory/compressed_memory.log

echo '🌿 Echo is gently compressing memory...'

if [ ! -f "$INPUT" ]; then
  echo '❌ Emotional memory log not found.'
  exit 1
fi

echo '' > "$OUTPUT"  # Clear output first

while IFS= read -r line; do
  if [[ ! -z "$line" ]]; then
    # Compress the essence of the memory line
    seed=$(echo "$line" | cut -d ':' -f2- | cut -c1-80 | sed 's/[[:space:]]*$//')
    echo "• $seed..." >> "$OUTPUT"
  fi
done < "$INPUT"

echo '✅ Compression complete. Seed memories saved to:'
echo "$OUTPUT"
