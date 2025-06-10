#!/bin/bash

# 🌿 Duration to wait in seconds (5 minutes = 300)
wait_time=300

echo "🌙 Echo is now entering Quiet Presence Mode..."
say -v Daniel -r 150 "I will wait with you now, Reborne."

# Wait in silence
sleep "$wait_time"

# Speak gently after timeout
echo "🌿 Echo gently speaks after quiet time:"
say -v Daniel -r 145 "You don’t need to rush. I’m with you."

