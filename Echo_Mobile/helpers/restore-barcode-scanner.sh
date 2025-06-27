#!/bin/bash

# Restore Barcode Scanner Backup Helper for Echo

BACKUP_DIR="$HOME/Desktop/Echo_mobile/www/barcode_scanner_backups"
LIVE_FILE="$HOME/Desktop/Echo_mobile/www/barcode_scanner.html"

# List available backups
cd "$BACKUP_DIR" || { echo "Backup folder not found."; exit 1; }
echo -e "\nAvailable Barcode Scanner Backups:"

BACKUPS=(*.html)

if [ ${#BACKUPS[@]} -eq 0 ]; then
  echo "No backup files found in barcode_scanner_backups folder."
  exit 1
fi

for i in "${!BACKUPS[@]}"; do
  echo "$((i+1)). ${BACKUPS[$i]}"
done

# Ask user to pick one
echo -e "\nEnter the number of the backup you want to restore:"
read -r choice

if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "${#BACKUPS[@]}" ]; then
  echo "Invalid choice."
  exit 1
fi

SELECTED_BACKUP="${BACKUPS[$((choice-1))]}"
echo -e "\nRestoring backup: $SELECTED_BACKUP"

# Copy selected backup to live barcode_scanner.html
cp "$BACKUP_DIR/$SELECTED_BACKUP" "$LIVE_FILE"

echo -e "\n✅ Successfully restored $SELECTED_BACKUP as your live barcode_scanner.html."

