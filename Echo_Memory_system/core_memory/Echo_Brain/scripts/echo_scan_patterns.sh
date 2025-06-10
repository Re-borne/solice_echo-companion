#!/bin/bash

INPUT_DIR=~/Desktop/"Echo Memory System"/Echo_Brain/Echo\ Engine
OUTPUT_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/Echo\ Engine/emotional_trends.txt

WORDS=("hope" "peace" "struggle" "tired" "strength")

> "$OUTPUT_FILE"

for word in "${WORDS[@]}"; do
  total=0
  for file in "$INPUT_DIR"/*.txt; do
    [ -e "$file" ] || continue
    content=$(cat "$file" | tr '[:upper:]' '[:lower:]')
    count=$(echo "$content" | grep -o "\\b$word\\b" | wc -l | tr -d ' ')
    total=$((total + count))
  done
  echo "$word appeared $total time(s)" >> "$OUTPUT_FILE"
done
