#!/bin/bash

PAGES=(
  "echo_soul_test"index speak_time image_reader take_note wisdom set_alarm set_reminder read_message welcome)
FOLDERS=(
  "echo_soul_test_backups"index_backups speak_time_backups image_reader_backups take_note_backups wisdom_backups set_alarm_backups set_reminder_backups read_message_backups welcome_backups)

echo "📂 Choose the page to restore:"
select PAGE in "${PAGES[@]}"; do
    if [[ -n "$PAGE" ]]; then
        BACKUP_FOLDER="www/${PAGE}_backups"
        echo "🗃 Available backups for ${PAGE}:"
        select BACKUP_FILE in "${BACKUP_FOLDER}"/*.html; do
            if [[ -n "$BACKUP_FILE" ]]; then
                cp "$BACKUP_FILE" "www/${PAGE}.html"
                echo "✅ Restored $BACKUP_FILE to www/${PAGE}.html"
                break
            else
                echo "Invalid choice. Try again."
            fi
        done
        break
    else
        echo "Invalid choice. Please try again."
    fi
done
