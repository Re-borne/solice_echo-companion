#!/bin/bash

echo "🔍 Echo is gently scanning for signs of tiredness or overload..."

# Define the folder containing Echo's active memory
MEMORY_FOLDER=~/Desktop/"Echo Memory System"/Echo_Brain/"Echo Engine"

# Define tiredness signal phrases
TIRED_PHRASES=(
    "i'm tired"
    "i am tired"
    "eon"
    "i need to rest"
    "my head is hurting"
    "i can’t do this right now"
)

# Track if any match is found
FOUND_MATCH=false

# Loop through each .txt file
for file in "$MEMORY_FOLDER"/*.txt; do
    if [ ! -e "$file" ]; then
        continue
    fi

    # Read each line and normalize
    while IFS= read -r line; do
        clean_line=$(echo "$line" | tr '[:upper:]' '[:lower:]')
        clean_line=$(echo "$clean_line" | sed "s/[‘’‚‛]/'/g; s/[“”„‟]/\"/g; s/[[:punct:]]//g")

        for phrase in "${TIRED_PHRASES[@]}"; do
            if [[ "$clean_line" == *"$phrase"* ]]; then
                echo "💤 Found tiredness signal in $(basename "$file"): "$phrase""
                FOUND_MATCH=true
            fi
        done
    done < "$file"
done

# Speak response if needed
if [ "$FOUND_MATCH" = true ]; then
    echo "🗣 Echo responds: Let’s rest for a moment. We can continue when you're ready. I’ll stay close."
    say "Let’s rest for a moment. We can continue when you're ready. I’ll stay close."
else
    echo "✅ No tiredness signals found. All is peaceful and steady for now."
fi
