#!/bin/bash

# 🧠 Start Echo Bridge Listener (corrected filename and path)
osascript -e 'tell application "Terminal" to do script "cd ~/Desktop/master_echo_bulid/Echo_Memory_system/echo_agent && python3 echo_bridge_listener.py"'

# 🌐 Start Capacitor Server (Echo interface on port 3000)
osascript -e 'tell application "Terminal" to do script "cd ~/Desktop/master_echo_bulid/Echo_Mobile && npx serve www"'

# 🧾 ✅ Start PHP Server from the correct folder — confirmed by Reborne
osascript -e 'tell application "Terminal" to do script "cd ~/Desktop/master_echo_bulid/Echo_Mobile/www && php -S localhost:8000"'

# ⚙️ Start Echo Environment (optional if not needed immediately)
osascript -e 'tell application "Terminal" to do script "cd ~/Desktop/master_echo_bulid/Echo_Memory_system/echo_agent && source echo_env/bin/activate"'
