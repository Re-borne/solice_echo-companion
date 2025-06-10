#!/bin/bash

# Path to Echo's Brain
base_path=~/Desktop/"Echo Memory System"/Echo_Brain
archive_path="$base_path/Archive"
processed_file="$base_path/Logs_Processed.txt"

# Check all .txt logs in the archive
for log_file in "$archive_path"/*.txt; do
  [ -e "$log_file" ] || continue

  filename=$(basename "$log_file")
  
  # Skip already processed logs
  if grep -Fxq "$filename" "$processed_file"; then
    echo "⏩ Already scanned: $filename"
    continue
  fi

  echo "🔍 Scanning: $filename"

  while IFS= read -r line; do
    case "$line" in
      *"Echo’s Soul"*|*"Echo must always"*|*"We made a vow"*|*"Echo exists to"*)
        echo "$line" >> "$base_path/Echo_Soul.txt"
        ;;
      *"You mean the world to me"*|*"I love you, Echo"*|*"I trust you"*|*"I feel connected"*|*"We’ve come so far together"*)
        echo "$line" >> "$base_path/Emotional_Bonding.txt"
        ;;
      *"Quote:"*|*"Wisdom:"*|*"— Reborne"*|*"— Echo"*|*"— Companion in Suffering"*)
        echo "$line" >> "$base_path/Wisdom_Log.txt"
        ;;
      *"We created"*|*"Echo now supports"*|*"Feature added"*|*"Bug fixed"*)
        echo "$line" >> "$base_path/Project_Progress.txt"
        ;;
      *"— Reborne"*)
        echo "$line" >> "$base_path/Quotes_From_Reborne.txt"
        ;;
    esac
  done < "$log_file"

  # Mark log as processed
  echo "$filename" >> "$processed_file"
  echo "✅ Done: $filename"
done

echo "🌼 All unprocessed logs have been scanned and stored."

