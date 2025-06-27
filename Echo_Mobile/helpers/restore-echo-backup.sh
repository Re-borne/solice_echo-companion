#!/bin/bash

# Unified Restore Script for Echo Pages

BASE_DIR="$HOME/Desktop/master_echo_build/echo_interactive/www"


# Separate arrays for page names and their backup folders
PAGES=("index" "speak_time""voice_capture_knowledge"
"voice_capture_knowledge_backups" "image_reader" "barcode_scanner" "tell_joke" "take_note" "wisdom" "set_alarm" "set_reminder" "read_message" "library")

FOLDERS=("index_backups" "speak_time_backups""voice_capture_knowledge"
"voice_capture_knowledge_backups" "image_reader_backups" "barcode_scanner_backups" "tell_joke_backups" "take_note_backups" "wisdom_backups" "set_alarm_backups" "set_reminder_backups" "read_message_backups" "library_backups")

# Display available pages to restore
echo -e "\nWhich page do you want to restore?"
for i in "${!PAGES[@]}"; do
  echo "$((i+1)). ${PAGES[$i]}"
done

echo -e "\nEnter the number of the page you want to restore:"
read -r page_choice

if ! [[ "$page_choice" =~ ^[0-9]+$ ]] || [ "$page_choice" -lt 1 ] || [ "$page_choice" -gt "${#PAGES[@]}" ]; then
  echo "Invalid selection."
  exit 1
fi

selected_page="${PAGES[$((page_choice-1))]}"
selected_folder="${FOLDERS[$((page_choice-1))]}"

BACKUP_FOLDER="$BASE_DIR/$selected_folder"
TARGET_FILE="$BASE_DIR/${selected_page}.html"

cd "$BACKUP_FOLDER" || { echo "Backup folder not found."; exit 1; }
echo -e "\nAvailable backups for $selected_page:"

BACKUPS=(*.html)

if [ ${#BACKUPS[@]} -eq 0 ]; then
  echo "No backup files found in $BACKUP_FOLDER."
  exit 1
fi

for i in "${!BACKUPS[@]}"; do
  echo "$((i+1)). ${BACKUPS[$i]}"
done

echo -e "\nEnter the number of the backup you want to restore:"
read -r backup_choice

if ! [[ "$backup_choice" =~ ^[0-9]+$ ]] || [ "$backup_choice" -lt 1 ] || [ "$backup_choice" -gt "${#BACKUPS[@]}" ]; then
  echo "Invalid choice."
  exit 1
fi

SELECTED_BACKUP="${BACKUPS[$((backup_choice-1))]}"
echo -e "\nRestoring: $SELECTED_BACKUP to $selected_page.html..."

cp "$BACKUP_FOLDER/$SELECTED_BACKUP" "$TARGET_FILE"

echo -e "\n✅ Successfully restored $selected_page.html from $SELECTED_BACKUP."
