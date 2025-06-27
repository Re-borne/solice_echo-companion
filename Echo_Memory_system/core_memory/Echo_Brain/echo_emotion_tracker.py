# echo_emotion_tracker.py
# Updated to read daily emotion snapshots and summarize totals

from collections import Counter
from datetime import datetime
import os

# Input and output paths
EMOTION_LOG_PATH = "sacred_logs/emotion_history.log"
OUTPUT_PATH = "emotional_trends.txt"

def load_emotion_totals():
    if not os.path.exists(EMOTION_LOG_PATH):
        print("Emotion log not found.")
        return []

    total_emotions = Counter()
    with open(EMOTION_LOG_PATH, 'r') as f:
        for line in f:
            if "—" in line and ":" in line:
                try:
                    parts = line.strip().split("—")[1]
                    emotion_entries = parts.split(",")
                    for entry in emotion_entries:
                        emotion, value = entry.strip().split(":")
                        total_emotions[emotion.strip()] += int(value.strip())
                except ValueError:
                    continue
    return total_emotions

def write_summary(totals):
    if not totals:
        print("No emotions found.")
        return

    total = sum(totals.values())

    with open(OUTPUT_PATH, 'w') as f:
        f.write("📊 Emotional Trends Summary (Daily Logs)\n")
        f.write(f"🗓️ Date: {datetime.now().date()}\n")
        f.write(f"🧠 Total Emotion Signals: {total}\n\n")
        for emotion, count in totals.most_common():
            percent = (count / total) * 100 if total > 0 else 0
            f.write(f"{emotion}: {count} total ({percent:.1f}%)\n")

    print(f"Emotional trends saved to: {OUTPUT_PATH}")

if __name__ == "__main__":
    totals = load_emotion_totals()
    write_summary(totals)

