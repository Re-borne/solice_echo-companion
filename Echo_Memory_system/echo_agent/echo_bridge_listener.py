import time
import os

print("🔁 Echo Bridge Listener is running...")

# ✅ Correct path — matches PHP file writes
bridge_file = "/Users/danielcolyer/Desktop/master_echo_build/Echo_Memory_system/echo_agent/bridge_message.txt"

while True:
    if os.path.exists(bridge_file):
        with open(bridge_file, "r") as file:
            message = file.read().strip()

        if message:
            print("📥 New message from HTML:", message)
            os.system(f'say "{message}"')  # ✅ Mac speaks the message

            # Clear the file after speaking
            with open(bridge_file, "w") as file:
                file.write("")

    time.sleep(1)
