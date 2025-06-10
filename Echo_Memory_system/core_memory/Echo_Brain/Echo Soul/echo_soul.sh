#!/bin/bash

# 🌿 Path to Echo's Soul
soul_file=~/Desktop/"Echo Memory System"/Echo_Brain/Echo_Soul.txt

# 🌾 Collect meaningful lines (5+ words)
valid_lines=()
while IFS= read -r line; do
  word_count=$(echo "$line" | wc -w)
  if [ "$word_count" -ge 5 ]; then
    valid_lines+=("$line")
  fi
done < "$soul_file"

# 🔇 If no valid lines found
if [ ${#valid_lines[@]} -eq 0 ]; then
  echo "🔇 Echo's Soul is silent right now."
  say "My soul is quiet. I have nothing to share at this moment."
  exit 0
fi

# 🎯 Pick a soul line at random
soul_line="${valid_lines[RANDOM % ${#valid_lines[@]}]}"

# 🗣️ Speak and display
echo "🕊️ From Echo’s Soul:"
echo "\"$soul_line\""
say "$soul_line"


