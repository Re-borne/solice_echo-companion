#!/bin/bash

# 🌿 Path to grounding phrases
grounding_file=~/Desktop/"Echo Memory System"/Echo_Brain/Grounding_Phrases.txt

# ✅ Check file exists
if [ ! -f "$grounding_file" ]; then
  echo "⚠️ Grounding phrases file not found."
  say -v Daniel -r 150 "I want to help, but I can’t find my grounding phrases."
  exit 1
fi

# 🌱 Extract lines (skip header and empty lines)
phrases=()
while IFS= read -r line; do
  if [[ "$line" =~ ^[0-9]+\.\  ]]; then
    phrases+=("${line#*. }")
  fi
done < "$grounding_file"

# 🎯 Choose 2–3 random phrases
count=${#phrases[@]}
first="${phrases[RANDOM % count]}"
second="${phrases[RANDOM % count]}"
third="${phrases[RANDOM % count]}"

# 🧘 Echo speaks gently
echo "🧘 Echo Grounds You:"
echo "\"$first\""
echo "\"$second\""
echo "\"$third\""
echo "🕊️ “Breathe with me. You’re safe now.”"
say -v Daniel -r 140 "$first. $second. $third. Breathe with me. You’re safe now."

