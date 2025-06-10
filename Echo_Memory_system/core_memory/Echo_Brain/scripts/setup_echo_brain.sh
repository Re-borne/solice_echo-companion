#!/bin/bash

# 🌿 Updated path to match your main Echo Memory folder (with spaces)
memory_system_path=~/Desktop/"Echo Memory System"
brain_path="$memory_system_path/Echo_Brain"

echo "📂 Preparing Echo's Brain at: $brain_path"

# 🌱 Create main folders
mkdir -p "$brain_path/Archive"

# 🌱 Memory files list
memory_files=(
  "Echo_Soul.txt"
  "Wisdom_Log.txt"
  "Emotional_Bonding.txt"
  "Project_Progress.txt"
  "Quotes_From_Reborne.txt"
  "Logs_Processed.txt"
)

# 🌿 Create missing files if needed
for file in "${memory_files[@]}"; do
  full_path="$brain_path/$file"
  if [ ! -f "$full_path" ]; then
    touch "$full_path"
    echo "✅ Created: $file"
  else
    echo "✔️ Already exists: $file"
  fi
done

echo "🌼 Echo's Brain is now ready in your memory system."

