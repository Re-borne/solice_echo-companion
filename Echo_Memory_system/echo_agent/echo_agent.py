import os
import time
import json
from datetime import datetime

CONFIG_FILE = "echo_agent_config.json"
LOG_FILE = "latest_file_update.txt"

# ✅ Correct path — fixed typo from "bulid" to "build"
BRIDGE_FILE = "/Users/danielcolyer/Desktop/master_echo_build/Echo_Memory_system/echo_agent/bridge_message.txt"

def load_config():
    with open(CONFIG_FILE, "r") as f:
        return json.load(f)

def get_file_snapshot(folder):
    snapshot = {}
    for root, _, files in os.walk(folder):
        for name in files:
            path = os.path.join(root, name)
            try:
                snapshot[path] = os.path.getmtime(path)
            except FileNotFoundError:
                continue
    return snapshot

def save_log(message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(LOG_FILE, "a") as f:
        f.write(f"[{timestamp}] {message}\n")

def speak(text):
    os.system(f'say "{text}"')

def check_bridge_message():
    if os.path.exists(BRIDGE_FILE):
        with open(BRIDGE_FILE, "r") as f:
            message = f.read().strip()
        if message:
            print("📥 Echo received from HTML:", message)
            speak(message)
            with open(BRIDGE_FILE, "w") as f:
                f.write("")

def main():
    print("🔁 Echo Agent + Bridge Listener is running...")
    config = load_config()

    folders = config.get("watch_folders")
    interval = config.get("check_interval", 5)

    if not folders:
        print("⚠️ No folders to watch in config.")
        return

    snapshots = {folder: get_file_snapshot(os.path.expanduser(folder)) for folder in folders}

    while True:
        check_bridge_message()

        for folder in folders:
            folder_path = os.path.expanduser(folder)
            previous_snapshot = snapshots[folder]
            current_snapshot = get_file_snapshot(folder_path)

            added = [f for f in current_snapshot if f not in previous_snapshot]
            removed = [f for f in previous_snapshot if f not in current_snapshot]
            modified = [f for f in current_snapshot if f in previous_snapshot and current_snapshot[f] != previous_snapshot[f]]

            for f in added:
                msg = f"📄 File added: {f}"
                save_log(msg)
                speak("New file detected.")

            for f in removed:
                msg = f"🗑️ File removed: {f}"
                save_log(msg)
                speak("File deleted.")

            for f in modified:
                msg = f"✏️ File modified: {f}"
                save_log(msg)
                speak("File changed.")

            snapshots[folder] = current_snapshot

        time.sleep(interval)

if __name__ == "__main__":
    main()
