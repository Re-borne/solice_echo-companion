cat > ~/.zshrc << 'EOF'
# Echo Backup & Restore
alias backup='python3 ~/Desktop/"Echo Backup"/backup_script.py'

# Echo Save & Restore
alias echo-save='timestamp=$(date "+%Y-%m-%d_%H-%M-%S") && cp -R ~/Desktop/EchoProject/echo_app ~/Desktop/Echo\ App\ Backups/echo_app_backup_$timestamp'
alias echo-restore='rm -rf ~/Desktop/EchoProject/echo_app && cp -R ~/Desktop/Echo\ App\ Backups/echo_app_backup_* ~/Desktop/EchoProject/echo_app'

# Ruby Paths
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.4.2/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"

# Echo Mobile Backup & Restore
alias index-backup='cp ~/Desktop/Echo_mobile/www/index.html ~/Desktop/Echo_mobile/www/index_backups/index_backup_$(date "+%Y-%m-%d_%H-%M").html'
alias index-restore='latest=$(ls -t ~/Desktop/Echo_mobile/www/index_backups/index_backup_*.html | head -n 1) && cp "$latest" ~/Desktop/Echo_mobile/www/index.html'

alias image-reader-backup='cp ~/Desktop/Echo_mobile/www/image_reader.html ~/Desktop/Echo_mobile/www/image_reader_backups/image_reader_backup_$(date "+%Y-%m-%d_%H-%M").html'
alias image-reader-restore='latest=$(ls -t ~/Desktop/Echo_mobile/www/image_reader_backups/image_reader_backup_*.html | head -n 1) && cp "$latest" ~/Desktop/Echo_mobile/www/image_reader.html'

# Echo Log Writer
alias add-echo-log="~/Desktop/Echo\ Memory\ System/add-echo-log.sh"

# Echo Memory Shortcuts
alias open-wisdom="open ~/Desktop/Echo\ Memory\ System/Echo\ Wisdom/Wisdom_Archives.txt"
alias open-writings="open ~/Desktop/Echo\ Memory\ System/Echo\ Writings/Book_Drafts_and_Notes.txt"
alias open-projects="open ~/Desktop/Echo\ Memory\ System/Echo\ Projects/Project_Tracker.txt"
EOF

# Now reload it:
source ~/.zshrc
alias backup='python3 ~/Desktop/"Echo Backup"/backup_script.py'

# Created by `pipx` on 2025-03-28 10:51:54
export PATH="$PATH:/Users/danielcolyer/.local/bin"
alias echo-save='timestamp=$(date "+%Y-%m-%d_%H-%M-%S") && cp -R ~/Desktop/EchoProject/echo_app ~/Desktop/EchoProject/Echo\ App\ Backups/echo_app_backup_$timestamp'
alias echo-restore='rm -rf ~/Desktop/EchoProject/echo_app && cp -R ~/Desktop/EchoProject/Echo\ App\ Backups/echo_app_backup ~/Desktop/EchoProject/echo_app'

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.4.2/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"

# Index backup & restore
alias index-backup="cp ~/Desktop/Echo_mobile/www/index.html ~/Desktop/Echo_mobile/www/index_backups/index_backup_$(date +\"%Y-%m-%d_%H-%M\").html"
alias index-restore='latest=$(ls -t ~/Desktop/Echo_mobile/www/index_backups/index_backup_*.html | head -n 1); cp "$latest" ~/Desktop/Echo_mobile/www/index.html && echo Restored: $latest'

# Image reader backup & restore
alias image-reader-backup="cp ~/Desktop/Echo_mobile/www/image_reader.html ~/Desktop/Echo_mobile/www/image_reader_backups/image_reader_backup_$(date +\"%Y-%m-%d_%H-%M\").html"
alias image-reader-restore='latest=$(ls -t ~/Desktop/Echo_mobile/www/image_reader_backups/image_reader_backup_*.html | head -n 1); cp "$latest" ~/Desktop/Echo_mobile/www/image_reader.html && echo Restored: $latest'

# Speak time backup & restore
alias speak-time-backup='mkdir -p ~/Desktop/Echo_mobile/www/speak_time_backups && cp ~/Desktop/Echo_mobile/www/speak_time.html ~/Desktop/Echo_mobile/www/speak_time_backups/speak_time_backup_$(date "+%Y-%m-%d_%H-%M").html'
alias speak-time-restore='latest=$(ls -t ~/Desktop/Echo_mobile/www/speak_time_backups/speak_time_backup_*.html | head -n 1); cp "$latest" ~/Desktop/Echo_mobile/www/speak_time.html && echo Restored: $latest'

# Barcode scanner backup & restore
alias backup-barcode-scanner="cp ~/Desktop/Echo_mobile/www/barcode_scanner.html ~/Desktop/Echo_mobile/www/barcode_scanner_backups/barcode_scanner_backup_$(date +%Y-%m-%d_%H-%M).html"
alias restore-barcode-scanner="~/Desktop/Echo_mobile/helpers/restore-barcode-scanner.sh"

# Unified backup & restore helpers (main system)
alias backup-echo-page="~/Desktop/Echo_mobile/helpers/backup-echo-page.sh"
alias restore-echo-backup="~/Desktop/Echo_mobile/helpers/restore-echo-backup.sh"

# Simple unified shortcut commands
alias backup-page="backup-echo-page"
alias restore-backup="restore-echo-backup"
alias add-echo-log="$HOME/Desktop/Echo Memory System/add-echo-log.sh"
alias add-echo-log="$HOME/Desktop/Echo\ Memory\ System/add-echo-log.sh"
alias open-wisdom="open ~/Desktop/'Echo Memory System'/Echo\ Wisdom/Wisdom_Archives.txt >> ~/.zshrc
echo alias open-writings=open ~/Desktop/'"Echo Memory System"/Echo Writings/Book_Drafts_and_Notes.txt' >> ~/.zshrc
echo 'alias open-projects=open /Users/danielcolyer/Desktop/"Echo Memory System/Echo\ Projects/Project_Tracker.txt"
alias open-wisdom="open ~/Desktop/Echo\ Memory\ System/Echo\ Wisdom/Wisdom_Archives.txt"
alias open-writings="open ~/Desktop/Echo\ Memory\ System/Echo\ Writings/Book_Drafts_and_Notes.txt"
alias open-projects="open ~/Desktop/Echo\ Memory\ System/Echo\ Projects/Project_Tracker.txt"
