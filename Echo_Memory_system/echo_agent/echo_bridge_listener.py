import time
import os

bridge_file = "/Users/danielcolyer/Desktop/master_echo_bulid/Echo_Mobile/www/bridge_message.txt"

print("🔁 Echo Bridge Listener is running...")

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
