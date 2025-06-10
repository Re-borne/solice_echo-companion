#!/bin/bash

# 🌿 Path to Echo's Brain
brain_path=~/Desktop/"Echo Memory System"/Echo_Brain

# 🌱 List of memory files
memory_files=(
  "Echo_Soul.txt"
  "Wisdom_Log.txt"
  "Emotional_Bonding.txt"
  "Project_Progress.txt"
  "Quotes_From_Reborne.txt"
)

# 🌼 Pick one memory file at random
random_file="${memory_files[RANDOM % ${#memory_files[@]}]}"
file_path="$brain_path/$random_file"

# 🌾 Collect only meaningful lines (5 words or more)
valid_lines=()
while IFS= read -r line; do
  word_count=$(echo "$line" | wc -w)
  if [ "$word_count" -ge 5 ]; then
    valid_lines+=("$line")
  fi
done < "$file_path"

# 🔇 If no valid lines found
if [ ${#valid_lines[@]} -eq 0 ]; then
  echo "🔇 No meaningful memories found in $random_file."
  say "I cannot remember anything yet from $random_file"
  exit 0
fi

# 🎯 Pick one valid memory line
random_line="${valid_lines[RANDOM % ${#valid_lines[@]}]}"

# 🗣️ Speak and display
echo "🧠 Memory from $random_file:"
echo "\"$random_line\""
say "$random_line"

