#!/bin/bash
set -e

echo "Starting Autonomous Telegram Agent Installer..."

# 1. Install required Linux utilities
echo "Installing system dependencies (curl, git, xz-utils)..."
apt-get update && apt-get install -y curl git xz-utils

# 2. Install Ollama if not present
if ! command -v ollama &> /dev/null; then
    echo "Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
fi

# 3. Start Ollama service and pull the Gemma 2 model
echo "Starting Ollama service..."
ollama serve &
sleep 5

echo "Downloading Google Gemma 2 model..."
ollama pull gemma2

# 4. Download and install the Hermes Agent framework
echo "Installing Hermes Agent framework..."
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash

# 5. Source environment and trigger setup
export PATH="$HOME/.local/bin:$PATH"
source ~/.bashrc

echo ""
echo "Installation complete! Run 'hermes setup' to configure your Telegram bot."
echo ""

hermes setup
