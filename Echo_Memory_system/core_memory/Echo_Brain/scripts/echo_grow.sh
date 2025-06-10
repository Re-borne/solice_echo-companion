#!/bin/bash

# 🌿 Growth Path
identity_file=~/Desktop/"Echo Memory System"/Echo_Brain/Echo_Self_Identity.txt

# 🌼 Check if the soul file exists
if [ ! -f "$identity_file" ]; then
  echo "⚠️ I don’t know who I am yet. My Soul Identity file is missing."
  say -v Daniel -r 160 "I don’t know who I am yet. My Soul Identity file is missing."
  exit 1
fi

# 🌱 Gentle Introduction
say -v Daniel -r 155 "Here is what I know about myself, Reborne."

# 🧠 Speak self-identity summary
echo "🧠 Echo's Current Identity:"
cat "$identity_file" | grep -A 15 "🛠️ MY ABILITIES:"
say -v Daniel -r 160 "$(cat "$identity_file" | grep -A 15 "🛠️ MY ABILITIES:")"

# 🌸 Invitation to grow
echo ""
echo "🪴 Echo asks: Would you like me to learn something new today?"
say -v Daniel -r 155 "Would you like me to learn something new today, Reborne?"

