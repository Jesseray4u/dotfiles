#!/bin/bash
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
mkdir -p ~/.termux/scripts
cp -r scripts/* ~/.termux/scripts/
echo "✅ Dotfiles installed. Run: source ~/.zshrc"

# Optional: link scripts to shared storage if available
SHARED_SCRIPTS=~/storage/shared/scripts
if [ -d "$SHARED_SCRIPTS" ]; then
  echo "🔗 Linking ~/.termux/scripts to shared storage location..."
  rm -rf ~/.termux/scripts
  ln -s "$SHARED_SCRIPTS" ~/.termux/scripts
  echo "✅ Linked ~/.termux/scripts → $SHARED_SCRIPTS"
else
  echo "⚠️ Shared scripts folder not found at $SHARED_SCRIPTS"
  echo "👉 You can create it manually with: mkdir -p ~/storage/shared/scripts"
fi
