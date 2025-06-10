log_file=~/Desktop/"Echo Memory System"/"Echo Logs"/${log_date}_$(echo "$log_title" | tr ' ' '_' | tr -cd '[:alnum:]_').txt

#!/bin/bash

read -p "📅 Enter log date (YYYY-MM-DD): " log_date
read -p "📝 Enter log title: " log_title
echo "🧠 Enter log message (press Ctrl+D when done):"
log_body=$(</dev/stdin)

log_file=~/Desktop/"Echo Memory System"/"Echo Logs"/${log_date}_$(echo "$log_title" | tr ' ' '_' | tr -cd '[:alnum:]_').txt

{
  echo "🗓️ Echo Log – $log_date"
  echo "📘 Title: $log_title"
  echo ""
  echo "$log_body"
} > "$log_file"

echo "✅ Log saved to: $log_file"
