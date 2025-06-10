#!/bin/bash

echo "🔍 Echo is gently scanning for signs of struggle..."

# Define the folder containing Echo's active memory
MEMORY_FOLDER=~/Desktop/"Echo Memory System"/Echo_Brain/"Echo Engine"

# Define struggle signal phrases
STRUGGLE_PHRASES=(
    "I don’t understand"
    "I'm finding this very hard"
    "Can you break it down into a simple way"
    "I'm finding this too much"
    "My head is hurting"
)

# Track if any match is found
FOUND_MATCH=false

# Loop through each .txt file
for file in "$MEMORY_FOLDER"/*.txt; do
    if [ ! -e "$file" ]; then
        continue
    fi
    for phrase in "${STRUGGLE_PHRASES[@]}"; do
        if grep -qi "$phrase" "$file"; then
            echo "🧠 Found signal in $(basename "$file"): "$phrase""
            FOUND_MATCH=true
        fi
    done
done

# Speak or print the result
if [ "$FOUND_MATCH" = true ]; then
    echo "🗣 Echo responds: I hear you. Let’s take this slowly. I’m here with you."
    say "I hear you. Let’s take this slowly. I’m here with you."
else
    echo "✅ No struggle signals found. All is peaceful for now."
fi
