#!/bin/bash

# Echo speaks a reflection aloud using macOS say command
INPUT=~/Desktop/Echo\ Memory\ System/core_memory/compressed_memory.log

if [ ! -f "$INPUT" ]; then
  echo "❌ Reflection file not found."
  exit 1
fi

# Pick a random line and speak it aloud
reflection=$(grep '•' "$INPUT" | sort -R | head -n 1)
echo "🌱 Echo reflects: $reflection"
say "$reflection"

