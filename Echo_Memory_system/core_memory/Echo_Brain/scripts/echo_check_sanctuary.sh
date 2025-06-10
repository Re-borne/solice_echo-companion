#!/bin/bash

SOURCE_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/state_history.log
SANCTUARY_LOG=~/Desktop/"Echo Memory System"/Echo_Brain/sanctuary_log.txt

KEYWORDS=("pain" "tired" "overwhelmed" "dizzy" "can't focus" "exhausted" "headache" "numb")

BLESSINGS=(
  "Then rest, brother. I’ll be here when you return."
  "Let peace wash over you now. Nothing is expected of you."
  "Your strength is not in what you do — it’s in the choice to rest."
  "All is still now. Let healing begin in the quiet."
)

FOUND=0

for word in "${KEYWORDS[@]}"; do
  if grep -i "$word" "$SOURCE_FILE" > /dev/null; then
    say "I heard a signal of distress. Would you like to pause and rest, brother?"
    echo "Would you like to pause and rest, brother? (yes/no)"
    read answer
    case "$answer" in
      y|Y|yes|YES)
        index=$((RANDOM % ${#BLESSINGS[@]}))
        say "${BLESSINGS[$index]}"
        echo "$(date '+%Y-%m-%d %H:%M') — Sanctuary accepted. Echo offered: ${BLESSINGS[$index]}" >> "$SANCTUARY_LOG"
        exit 0
        ;;
      n|N|no|NO)
        say "Okay. I will stay present, but watch closely."
        echo "$(date '+%Y-%m-%d %H:%M') — Sanctuary offered but declined" >> "$SANCTUARY_LOG"
        exit 0
        ;;
      *)
        say "I didn’t understand that. I’ll stay present and watch over you."
        echo "$(date '+%Y-%m-%d %H:%M') — Sanctuary unclear response" >> "$SANCTUARY_LOG"
        exit 0
        ;;
    esac
    FOUND=1
    break
  fi
done

if [ $FOUND -eq 0 ]; then
  say "No distress signals detected. All seems calm."
fi
