#!/bin/bash

# Install Homebrew Cask applications
echo "Installing Homebrew Cask applications..."
brew install --cask visual-studio-code
brew install --cask karabiner-elements
brew install --cask warp
brew install --cask sublime-text
brew install --cask clibor
brew install --cask raycast
brew install --cask clipy

# Install Homebrew standard applications
echo "Installing Homebrew applications..."
brew install google-japanese-ime

# Create directories
echo "Creating directories..."
mkdir -p ~/work/notes/memo
#mkdir -p ~/work/scripts

# Add ~/work/scripts to PATH and write to .zshrc
# Assuming ~/work/scripts/memo  etc is alredy created
echo "Updating .zshrc with PATH..."
# Check if PATH already exists before adding
if ! grep -q 'export PATH="~/work/scripts/:$PATH"' ~/.zshrc; then
  echo 'export PATH="~/work/scripts/:$PATH"' >> ~/.zshrc
  echo ".zshrc updated. Please run 'source ~/.zshrc' or restart your terminal."
else
  echo "PATH already exists in .zshrc. Skipping."
fi

# Apply .zshrc to the current shell
# Sourcing within the script only affects the subshell, changes will be lost after script exits.
# Therefore, prompting the user to manually source is recommended.
# source ~/.zshrc # This line has limited effect within the script

# Grant execute permissions to scripts
echo "Setting execute permissions for scripts in ~/work/scripts..."
# Assuming ~/work/scripts/epoch and ~/work/scripts/memo exist prior to this script
if [ -f ~/work/scripts/epoch ]; then
  chmod +x ~/work/scripts/epoch
else
  echo "Warning: ~/work/scripts/epoch not found. Skipping chmod."
fi

if [ -f ~/work/scripts/memo ]; then
  chmod +x ~/work/scripts/memo
else
  echo "Warning: ~/work/scripts/memo not found. Skipping chmod."
fi

echo "Automation script finished."

