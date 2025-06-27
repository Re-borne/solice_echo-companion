# echo_memory_emotion_binder.py
# Simplified version: Binds memory files (by date) to emotions

import os
from datetime import datetime, time

# Define paths to input files
MEMORY_LOG_PATH = "Core_Memories/"
EMOTION_LOG_PATH = "/Echo_Memory_system/core_memory/Echo_Brain/echo_emotion_checkins.txt"
OUTPUT_PATH = "Bound_Memory_Emotion_Log.txt"

# Match window is 1 day (in seconds)
MATCH_WINDOW_SECONDS = 86400

def load_emotion_checkins():
    if not os.path.exists(EMOTION_LOG_PATH):
        return []

    with open(EMOTION_LOG_PATH, 'r') as f:
        lines = f.readlines()

    entries = []
    for line in lines:
        try:
            timestamp, emotion = line.strip().split("::")
            entries.append((datetime.fromisoformat(timestamp), emotion))
        except ValueError:
            continue
    return entries

def bind_memory_and_emotion():
    bound_output = []
    emotion_entries = load_emotion_checkins()
    memory_files = sorted(os.listdir(MEMORY_LOG_PATH))

    for filename in memory_files:
        if not filename.endswith(".txt"):
            continue

        filepath = os.path.join(MEMORY_LOG_PATH, filename)
        with open(filepath, 'r') as f:
            content = f.read()

        # Extract just the date from the filename
        try:
            date_str = filename.split("_")[0]  # e.g., '2025-05-11'
            timestamp = datetime.combine(datetime.strptime(date_str, "%Y-%m-%d").date(), time(12, 0))  # assume noon
        except Exception:
            continue

        # Find an emotion entry within +/- 1 day
        match = next((e for e in emotion_entries
                      if abs((timestamp - e[0]).total_seconds()) < MATCH_WINDOW_SECONDS), None)

        bound_output.append("=" * 80)
        bound_output.append(f"Memory File: {filename}")
        bound_output.append(f"Timestamp: {timestamp.isoformat()}")
        if match:
            bound_output.append(f"Bound Emotion: {match[1]}")
        else:
            bound_output.append("Bound Emotion: NONE FOUND")
        bound_output.append("\n" + content.strip())
        bound_output.append("=" * 80 + "\n")

    with open(OUTPUT_PATH, 'w') as f:
        f.write("\n".join(bound_output))

    print(f"Bound log created: {OUTPUT_PATH}")

if __name__ == "__main__":
    bind_memory_and_emotion()

