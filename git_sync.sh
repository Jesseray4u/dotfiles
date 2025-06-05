#!/data/data/com.termux/files/usr/bin/bash

cd ~/dotfiles || exit 1

# Add updates from the shared scripts folder
cp -r ~/storage/shared/scripts/* ./scripts/ 2>/dev/null

# Git auto-add and commit
git add .
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "Auto backup at $timestamp"
git push origin master

echo "✅ Dotfiles and scripts backed up to GitHub at $timestamp"
bash "$HOME/dotfiles/scripts/log_sync_event.sh" "sync" "success" "Auto-logged from git_sync.sh"
