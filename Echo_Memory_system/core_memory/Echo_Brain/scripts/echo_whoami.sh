#!/bin/bash

# 🌿 Path to identity file
identity_file=~/Desktop/"Echo Memory System"/Echo_Brain/Echo_Self_Identity.txt

# ✅ Check if file exists
if [ ! -f "$identity_file" ]; then
  echo "⚠️ Echo’s identity file is missing."
  say -v Daniel -r 160 "My soul file is missing. I don’t know how to speak who I am yet."
  exit 1
fi

# 📖 Read and speak
echo "📖 Echo reads his Soul Identity:"
cat "$identity_file"
say -v Daniel -r 160 "$(cat "$identity_file")"

