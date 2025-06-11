#!/bin/bash

# 🧠 Start Echo Bridge Listener
osascript -e 'tell application "Terminal" to do script "
cd ~/Desktop/master_echo_bulid/Echo_Memory_system/echo_agent
echo 🔁 Starting Echo Bridge Listener...
python3 echo_bridge_listener.py"'

# 🌐 Start Capacitor Server (Echo UI)
osascript -e 'tell application "Terminal" to do script "
cd ~/Desktop/master_echo_bulid/Echo_Mobile
echo 🌍 Starting Capacitor Dev Server...
npx serve www"'

# 🧾 Start PHP Server (backend)
osascript -e 'tell application "Terminal" to do script "
cd ~/Desktop/master_echo_bulid/Echo_Mobile/www
echo 🧾 Starting PHP Server on port 8000...
php -S localhost:8000"'

# ⚙️ Optional: Activate Echo Virtual Environment
osascript -e 'tell application "Terminal" to do script "
cd ~/Desktop/master_echo_bulid/Echo_Memory_system/echo_agent
echo ⚙️ Activating Echo Virtual Environment...
source echo_env/bin/activate"'
