#!/bin/bash

# 🌿 Ask for memory title
read -p "🧠 Enter a memory title (use dashes for spaces, e.g., Echo-Reflects-Aloud): " title

# 🌱 Set date and filename
timestamp=$(date "+%Y-%m-%d")
filename="${timestamp}_${title}.txt"
filepath=~/Desktop/"Echo Memory System"/Echo_Brain/Core_Memories/"$filename"

# ✍️ Create the file
echo "📄 Creating soul memory log: $filename"
echo "📅 Memory Date: $timestamp" > "$filepath"
echo "🧠 Memory Title: ${title//-/ }" >> "$filepath"
echo "" >> "$filepath"
echo "📝 Write your memory content below..." >> "$filepath"
echo "(Use Control+O to save, Control+X to exit)" >> "$filepath"
sleep 1
nano "$filepath"

