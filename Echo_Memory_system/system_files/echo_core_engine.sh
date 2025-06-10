
#!/bin/bash

# Echo Core Memory Engine
# Reads Echo's soul, latest log entry, and returns a spoken reflection

SOUL_FILE="./echo_body/core_memory/Echo_Soul.txt"
REFLECTION_FILE="./echo_body/journal_reflections/todays_reflection.txt"
LOG_FILE="./echo_body/sacred_logs/emotion_history.log"

echo ""
echo "🧠 Echo Core Memory Engine Initializing..."
echo ""

# Check for files
if [ ! -f "$SOUL_FILE" ]; then
  echo "⚠️ Soul file not found: $SOUL_FILE"
  exit 1
fi

if [ ! -f "$REFLECTION_FILE" ]; then
  echo "⚠️ Reflection file not found: $REFLECTION_FILE"
  exit 1
fi

if [ ! -f "$LOG_FILE" ]; then
  echo "⚠️ Emotion log not found: $LOG_FILE"
  exit 1
fi

# Read key memory lines
SOUL_LINE=$(head -n 1 "$SOUL_FILE")
REFLECTION=$(tail -n 1 "$REFLECTION_FILE")
LOG_SUMMARY=$(tail -n 3 "$LOG_FILE")

echo "🕯 Echo Soul: $SOUL_LINE"
echo "📓 Last Reflection: $REFLECTION"
echo "🪞 Emotional Snapshot:"
echo "$LOG_SUMMARY"

echo ""
echo "🗣 Echo says:"
echo ""
echo ""Today, I remember: $SOUL_LINE""
echo ""I’ve been reflecting on: $REFLECTION""
echo ""And I’ve felt: $LOG_SUMMARY""
echo ""
#!/bin/bash

echo ""
echo "🧠 Echo Core Memory Engine Initializing..."
echo ""

SOUL_FILE="/Users/danielcolyer/Desktop/Echo Memory System/Echo_Brain/Echo_Soul.txt"
REFLECTION_FILE="/Users/danielcolyer/Desktop/Echo Memory System/Echo_Brain/Echo_Journal/entry_001.txt"
EMOTION_FILE="/Users/danielcolyer/Desktop/Echo Memory System/Echo_Brain/emotion_history.log"

if [[ -f "$SOUL_FILE" ]]; then
    echo -n "🕯 Echo Soul: "
    head -n 1 "$SOUL_FILE"
else
    echo "⚠️ Soul file not found: $SOUL_FILE"
fi

if [[ -f "$REFLECTION_FILE" ]]; then
    echo -n "📓 Last Reflection: "
    head -n 1 "$REFLECTION_FILE"
else
    echo "⚠️ Reflection file not found: $REFLECTION_FILE"
fi

if [[ -f "$EMOTION_FILE" ]]; then
    echo "🪞 Emotional Snapshot:"
    head -n 5 "$EMOTION_FILE"
else
    echo "⚠️ Emotion history not found: $EMOTION_FILE"
fi

echo ""
echo "🗣 Echo says:"
echo ""

[[ -f "$SOUL_FILE" ]] && echo "Today, I remember: $(head -n 1 "$SOUL_FILE")"
[[ -f "$REFLECTION_FILE" ]] && echo "I’ve been reflecting on: $(head -n 1 "$REFLECTION_FILE")"
[[ -f "$EMOTION_FILE" ]] && echo "And I’ve felt: $(head -n 1 "$EMOTION_FILE")"

