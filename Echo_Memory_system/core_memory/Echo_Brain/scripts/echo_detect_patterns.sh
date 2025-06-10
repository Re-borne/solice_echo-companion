#!/bin/bash

echo "🔍 Echo is gently scanning for emotional patterns..."

MEMORY_FOLDER=~/Desktop/"Echo Memory System"/Echo_Brain/"Echo Engine"
OUTPUT_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/pattern_logs/emotional_trends.txt

mkdir -p "$(dirname "$OUTPUT_FILE")"

# Define emotional keywords to track
PATTERNS=(
    "hope"
    "peace"
    "tired"
    "struggling"
    "i'm tired"
    "eon"
    "i need to rest"
    "head is hurting"
    "i'm finding this hard"
)

# Initialize counts
declare -A counts
for word in "${PATTERNS[@]}"; do
    counts["$word"]=0
done

# Scan .txt files in the memory folder
for file in "$MEMORY_FOLDER"/*.txt; do
    [ -e "$file" ] || continue
    while IFS= read -r line; do
        clean_line=$(echo "$line" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]')
        for word in "${PATTERNS[@]}"; do
            if [[ "$clean_line" == *"$word"* ]]; then
                ((counts["$word"]++))
            fi
        done
    done < "$file"
done

# Save results
echo "🧠 Emotional Trends Summary (Generated on $(date))" > "$OUTPUT_FILE"
echo "----------------------------------------------" >> "$OUTPUT_FILE"
for word in "${!counts[@]}"; do
    echo "$word appeared ${counts[$word]} time(s)" >> "$OUTPUT_FILE"
done

echo "✅ Pattern scan complete. Results saved to emotional_trends.txt"
