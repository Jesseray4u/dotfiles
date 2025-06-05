#!/data/data/com.termux/files/usr/bin/bash

cd ~/dotfiles || exit
echo "🔄 Auto-pulling from GitHub..."
git pull origin master --no-edit
echo "✅ Sync complete: $(date)"
