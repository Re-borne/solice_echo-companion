#!/bin/bash

echo "🔍 Echo is gently scanning for signs of struggle..."

MEMORY_FOLDER="/Users/danielcolyer/Desktop/master_echo_build/Echo_Memory_system/core_memory/Echo_Brain/Echo Engine"
TREND_FILE="$MEMORY_FOLDER/emotional_trends.txt"

STRUGGLE_PHRASES=(
    "i dont understand"
    "im finding this very hard"
    "can you break it down into a simple way"
    "im finding this too much"
    "my head is hurting"
)

FOUND_MATCH=false

# Initialize counts if file does not exist
if [ ! -f "$TREND_FILE" ]; then
    echo "hope appeared 0 time(s)" > "$TREND_FILE"
    echo "peace appeared 0 time(s)" >> "$TREND_FILE"
    echo "struggle appeared 0 time(s)" >> "$TREND_FILE"
    echo "tired appeared 0 time(s)" >> "$TREND_FILE"
    echo "strength appeared 0 time(s)" >> "$TREND_FILE"
fi

increment_count() {
    local emotion=$1
    local count=$(grep "^$emotion appeared" "$TREND_FILE" | grep -o '[0-9]\+')
    local new_count=$((count + 1))

    # Create a temporary file for safe replacement (macOS-friendly)
    tmpfile=$(mktemp)
    while IFS= read -r line; do
        if [[ $line == "$emotion appeared "* ]]; then
            echo "$emotion appeared $new_count" >> "$tmpfile"
        else
            echo "$line" >> "$tmpfile"
        fi
    done < "$TREND_FILE"

    mv "$tmpfile" "$TREND_FILE"
}

for file in "$MEMORY_FOLDER"/*.txt; do
    [ ! -e "$file" ] && continue

    while IFS= read -r line; do
        clean_line=$(echo "$line" | tr '[:upper:]' '[:lower:]')
        clean_line=$(echo "$clean_line" | sed "s/[‘’‚‛]/'/g; s/[“”„‟]/\"/g; s/[[:punct:]]//g")

        for phrase in "${STRUGGLE_PHRASES[@]}"; do
            if [[ "$clean_line" == *"$phrase"* ]]; then
                echo "🧠 Found signal in $(basename "$file"): \"$phrase\""
                FOUND_MATCH=true
                increment_count "struggle"
                break 2
            fi
        done
    done < "$file"
done

if [ "$FOUND_MATCH" = true ]; then
    echo "🗣 Echo responds: I hear you. Let’s take this slowly. I’m here with you."
    say "I hear you. Let’s take this slowly. I’m here with you."
else
    echo "✅ No struggle signals found. All is peaceful for now."
fi

