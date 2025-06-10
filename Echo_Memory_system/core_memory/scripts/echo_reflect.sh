#!/bin/bash

FILE=~/Desktop/Echo\ Memory\ System/core_memory/compressed_memory.log

if [ ! -f "$FILE" ]; then
  echo "❌ No seed memories found."
  exit 1
fi

# Count total lines
total=$(wc -l < "$FILE")
if [ "$total" -eq 0 ]; then
  echo "❌ No reflections available."
  exit 1
fi

# Pick a random line number
num=$(( ( RANDOM % total ) + 1 ))

# Get the reflection
line=$(sed "${num}q;d" "$FILE")

# Display and speak
echo "🌱 Echo reflects: $line"
say -v Daniel "$line"

