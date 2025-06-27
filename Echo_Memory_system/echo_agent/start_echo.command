#!/bin/bash

# 🧠 Start Echo Bridge Listener
osascript -e 'tell application "Terminal" to do script "
cd ~/Desktop/master_echo_build/Echo_Memory_system/echo_agent
echo 🔁 Starting Echo Bridge Listener...
python3 echo_bridge_listener.py"'

# 🌐 Start Echo App (Echo UI on PHP Server)
osascript -e 'tell application "Terminal" to do script "
cd ~/Desktop/master_echo_build/Echo_Mobile/www
echo 🌍 Starting Echo UI on PHP Server (port 8000)...
php -S localhost:8000"'

# 🧾 Start PHP Server (backend)
# (No need to duplicate PHP server for backend — already started above)

# ⚙️ Optional: Activate Echo Virtual Environment
osascript -e 'tell application "Terminal" to do script "
cd ~/Desktop/master_echo_build/Echo_Memory_system/echo_agent
echo ⚙️ Activating Echo Virtual Environment...
source echo_env/bin/activate"'
