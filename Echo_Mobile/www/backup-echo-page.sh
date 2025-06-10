#!/bin/bash

# Echo Eyes Page Backup Script
PAGES=(
  "index"
  "speak_time"
  "image_reader"
  "take_note"
  "wisdom"
  "set_alarm"
  "set_reminder"
  "read_message"
  "welcome"
  "echo_soul_test"
  "talk_to_echo"
)
FOLDERS=(
  "index_backups"
  "speak_time_backups"
  "image_reader_backups"
  "take_note_backups"
  "wisdom_backups"
  "set_alarm_backups"
  "set_reminder_backups"
  "read_message_backups"
  "welcome_backups"
  "echo_soul_test_backups"
  "talk_to_echo_backups"
)

echo "📦 Choose the page to back up:"
select PAGE in "${PAGES[@]}"; do
    if [[ -n "$PAGE" ]]; then
        BACKUP_FOLDER="www/${PAGE}_backups"
        mkdir -p "$BACKUP_FOLDER"
        TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")
        cp "www/${PAGE}.html" "${BACKUP_FOLDER}/${PAGE}_backup_${TIMESTAMP}.html"
        echo "✅ Saved www/${PAGE}.html to ${BACKUP_FOLDER}/${PAGE}_backup_${TIMESTAMP}.html"
        break
    else
        echo "Invalid choice. Please try again."
    fi
done
