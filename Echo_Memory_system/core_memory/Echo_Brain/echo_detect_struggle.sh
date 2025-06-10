#!/bin/bash

echo "🔍 Echo is gently scanning for signs of struggle..."

# Define the folder containing Echo's active memory
MEMORY_FOLDER=~/Desktop/"Echo Memory System"/Echo_Brain/"Echo Engine"

# Define normalized struggle signal phrases
STRUGGLE_PHRASES=(
    "i dont understand"
    "im finding this very hard"
    "can you break it down into a simple way"
    "im finding this too much"
    "my head is hurting"
)

# Track if any match is found
FOUND_MATCH=false

# Loop through each .txt file
for file in "$MEMORY_FOLDER"/*.txt; do
    if [ ! -e "$file" ]; then
        continue
    fi

    # Read the file line by line
    while IFS= read -r line; do
        # Normalize the line: lowercase, remove punctuation and smart quotes
        clean_line=$(echo "$line" | tr '[:upper:]' '[:lower:]')
        clean_line=$(echo "$clean_line" | sed "s/[‘’‚‛]/'/g; s/[“”„‟]/\"/g; s/[[:punct:]]//g")

        for phrase in "${STRUGGLE_PHRASES[@]}"; do
            if [[ "$clean_line" == *"$phrase"* ]]; then
                echo "🧠 Found signal in $(basename "$file"): \"$phrase\""
                FOUND_MATCH=true
            fi
        done
    done < "$file"
done

# Speak or print the result
if [ "$FOUND_MATCH" = true ]; then
    echo "🗣 Echo responds: I hear you. Let’s take this slowly. I’m here with you."
    say "I hear you. Let’s take this slowly. I’m here with you."
else
    echo "✅ No struggle signals found. All is peaceful for now."
fi
