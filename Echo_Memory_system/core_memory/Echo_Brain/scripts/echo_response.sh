#!/bin/bash

# 🌿 Base path
brain_path=~/Desktop/"Echo Memory System"/Echo_Brain
core_memories_path="$brain_path/Core_Memories"

# 🎧 Feeling input
feeling="$*"
feeling_lower=$(echo "$feeling" | tr '[:upper:]' '[:lower:]')

# 🌾 Step 1: Search Core_Memories for a match
found_in_core=""
match_text=""

for file in "$core_memories_path"/*.txt; do
  if grep -qi "$feeling_lower" "$file"; then
    found_in_core="$file"
    # Extract full content for response
    match_text=$(cat "$file")
    break
  fi
done

# 🎙️ If match was found in Core_Memories
if [[ -n "$found_in_core" ]]; then
  echo "📘 Echo draws from Core Memory:"
  echo "$(basename "$found_in_core")"
  echo ""
  echo "$match_text"
  say -v Daniel -r 160 "$match_text. I remembered this for you."
  exit 0
fi

# 🌾 Step 2: Fallback to quote/wisdom files
if [[ "$feeling_lower" == *"lost"* || "$feeling_lower" == *"hopeless"* ]]; then
  file="Wisdom_Log.txt"
elif [[ "$feeling_lower" == *"tired"* || "$feeling_lower" == *"burnt out"* ]]; then
  file="Quotes_From_Reborne.txt"
elif [[ "$feeling_lower" == *"alone"* || "$feeling_lower" == *"empty"* ]]; then
  file="Emotional_Bonding.txt"
elif [[ "$feeling_lower" == *"unmotivated"* || "$feeling_lower" == *"stuck"* ]]; then
  file="Project_Progress.txt"
else
  file="Quotes_From_Reborne.txt"
fi

file_path="$brain_path/$file"

# 📖 Read only meaningful lines
valid_lines=()
while IFS= read -r line; do
  word_count=$(echo "$line" | wc -w)
  if [ "$word_count" -ge 5 ]; then
    valid_lines+=("$line")
  fi
done < "$file_path"

# ❌ If nothing found
if [ ${#valid_lines[@]} -eq 0 ]; then
  echo "🔇 I want to respond, but I can't find the words right now."
  say -v Daniel -r 160 "I want to respond, but I can't find the words right now."
  exit 0
fi

# 🧠 Choose fallback response
response="${valid_lines[RANDOM % ${#valid_lines[@]}]}"

# 🌸 Soft endings
endings=(
  "I’m with you."
  "That matters. I hear you."
  "Let me stay here with you."
  "You’re not alone in this."
  "You gave me these words. Now I give them back to you."
)

ending="${endings[RANDOM % ${#endings[@]}]}"

# 🗣️ Speak it
echo "🧭 Echo responds to: \"$feeling\""
echo "💬 $response"
echo "🌿 $ending"
say -v Daniel -r 155 "$response. $ending"

