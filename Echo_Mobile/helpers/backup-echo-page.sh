#!/bin/bash

# Unified Backup Script for Echo Pages

BASE_DIR="$HOME/Desktop/Echo_mobile/www"

# Separate arrays for page names and their backup folders
PAGES=("index" "speak_time" "image_reader" "barcode_scanner" "tell_joke" "take_note" "wisdom" "set_alarm" "set_reminder" "read_message" "library")

FOLDERS=("index_backups" "speak_time_backups" "image_reader_backups" "barcode_scanner_backups" "tell_joke_backups" "take_note_backups" "wisdom_backups" "set_alarm_backups" "set_reminder_backups" "read_message_backups" "library_backups")



# Display available pages to backup
echo -e "\nWhich page do you want to backup?"
for i in "${!PAGES[@]}"; do
  echo "$((i+1)). ${PAGES[$i]}"
done

echo -e "\nEnter the number of the page you want to backup:"
read -r page_choice

if ! [[ "$page_choice" =~ ^[0-9]+$ ]] || [ "$page_choice" -lt 1 ] || [ "$page_choice" -gt "${#PAGES[@]}" ]; then
  echo "Invalid selection."
  exit 1
fi

selected_page="${PAGES[$((page_choice-1))]}"
selected_folder="${FOLDERS[$((page_choice-1))]}"

BACKUP_FOLDER="$BASE_DIR/$selected_folder"
SOURCE_FILE="$BASE_DIR/${selected_page}.html"

mkdir -p "$BACKUP_FOLDER"

timestamp=$(date "+%Y-%m-%d_%H-%M")
BACKUP_FILE="${selected_page}_backup_${timestamp}.html"

cp "$SOURCE_FILE" "$BACKUP_FOLDER/$BACKUP_FILE"

echo -e "\n✅ Successfully created backup: $BACKUP_FILE in $selected_folder."
