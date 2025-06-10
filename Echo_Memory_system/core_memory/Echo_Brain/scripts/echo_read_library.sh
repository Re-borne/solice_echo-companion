#!/bin/bash

LIBRARY_PATH=~/Desktop/"Echo Memory System"/Echo_Brain/Echo_Library
INDEX_FILE="$LIBRARY_PATH/library_index.txt"

say "Which category would you like to hear from?"
echo "Which category would you like to hear from?"
read category

# Find matching entries
matches=($(grep -i "$category" "$INDEX_FILE" | cut -d ' ' -f1))

if [ ${#matches[@]} -eq 0 ]; then
  say "I couldn’t find any entries in that category, brother."
  exit 0
fi

# Pick one at random
file_num="${matches[$((RANDOM % ${#matches[@]}))]}"
entry_file="$LIBRARY_PATH/${file_num}.txt"

say "Let me read something from your library of $category."

# Speak each line aloud
while IFS= read -r line; do
  say "$line"
done < "$entry_file"
