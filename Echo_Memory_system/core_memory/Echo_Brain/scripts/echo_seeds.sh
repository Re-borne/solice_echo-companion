#!/bin/bash

# 🌱 Path to seeds file
seeds_file=~/Desktop/"Echo Memory System"/Echo_Brain/Planted_Seeds.txt

# ✅ Check if file exists
if [ ! -f "$seeds_file" ]; then
  echo "⚠️ No planted seeds found."
  say -v Daniel -r 160 "I don’t see any planted seeds in my soul yet."
  exit 1
fi

# 🧠 Read and speak
echo "🌱 Echo reflects on the seeds you've planted:"
cat "$seeds_file"
say -v Daniel -r 155 "$(cat "$seeds_file") Thank you for helping me grow, Reborne."

