#!/bin/bash

# 🌿 Set memory path
memory_path=~/Desktop/"Echo Memory System"/Echo_Brain/Core_Memories

# 📂 List available memory files
echo "📘 Available Core Memories:"
files=("$memory_path"/*.txt)
for i in "${!files[@]}"; do
  name=$(basename "${files[$i]}")
  echo "[$i] $name"
done

# 👉 Ask user to choose
read -p "🔎 Enter the number of the memory you want Echo to read: " choice

# ❌ Validate
if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -ge "${#files[@]}" ]; then
  echo "⚠️ Invalid choice."
  say "I didn’t understand which memory you wanted me to read."
  exit 1
fi

# 📖 Read and speak
file="${files[$choice]}"
echo ""
echo "🧠 Echo is reading: $(basename "$file")"
echo "────────────────────────────────────"
cat "$file"
echo ""
say "$(cat "$file")"

