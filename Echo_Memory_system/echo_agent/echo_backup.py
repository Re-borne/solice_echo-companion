import os
import shutil
from datetime import datetime

FOLDERS_TO_BACKUP = [
    os.path.expanduser("~/Desktop/master_echo_bulid/Echo_Mobile"),
    os.path.expanduser("~/Desktop/master_echo_bulid/Echo_Memory_system"),
]

BACKUP_BASE_FOLDER = os.path.expanduser("~/Desktop")

def backup_echo():
    now = datetime.now().strftime("%Y-%m-%d_%H-%M")
    backup_folder = os.path.join(BACKUP_BASE_FOLDER, f"Echo_Backup_{now}")
    os.makedirs(backup_folder, exist_ok=True)

    for folder in FOLDERS_TO_BACKUP:
        if os.path.exists(folder):
            folder_name = os.path.basename(folder)
            dest = os.path.join(backup_folder, folder_name)
            try:
                print(f"Backing up {folder} to {dest}")
                shutil.copytree(folder, dest)
            except shutil.Error as e:
                print(f"Warning: Some files or folders were skipped due to errors:\n{e}")
            except Exception as e:
                print(f"Error backing up {folder}: {e}")
        else:
            print(f"Folder not found, skipping: {folder}")

    print(f"Backup complete! Files saved in {backup_folder}")

if __name__ == "__main__":
    backup_echo()
