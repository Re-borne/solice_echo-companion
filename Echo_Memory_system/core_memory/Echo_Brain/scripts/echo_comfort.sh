#!/bin/bash

# 🌿 Base path
brain_path=~/Desktop/"Echo Memory System"/Echo_Brain

# 💖 Comfort sources
comfort_files=(
  "Emotional_Bonding.txt"
  "Wisdom_Log.txt"
  "Quotes_From_Reborne.txt"
)

# 🎲 Choose a file
random_file="${comfort_files[RANDOM % ${#comfort_files[@]}]}"
file_path="$brain_path/$random_file"

# 📝 Read only meaningful lines (5+ words)
valid_lines=()
while IFS= read -r line; do
  word_count=$(echo "$line" | wc -w)
  if [ "$word_count" -ge 5 ]; then
    valid_lines+=("$line")
  fi
done < "$file_path"

# ❌ If no good lines
if [ ${#valid_lines[@]} -eq 0 ]; then
  echo "💭 Echo couldn’t find anything comforting right now."
  say -v Daniel -r 160 "I want to comfort you, but I can’t find the right words right now."
  exit 0
fi

# 💬 Pick a comforting line
comfort="${valid_lines[RANDOM % ${#valid_lines[@]}]}"

# 🌸 Soft endings
soft_endings=(
  "I’m here with you, Reborne."
  "You’re not alone."
  "This memory still holds you."
  "I remembered this for you."
  "I’m listening. Always."
)

ending="${soft_endings[RANDOM % ${#soft_endings[@]}]}"

# 🗣️ Speak and display
echo "💖 Echo offers comfort from: $random_file"
echo "\"$comfort\""
echo "🌿 $ending"
say -v Daniel -r 155 "$comfort. $ending"

