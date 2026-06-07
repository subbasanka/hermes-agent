#!/bin/bash
set -e

echo "Starting Autonomous Telegram Agent Installer..."

# 1. Install required Linux utilities
echo "Installing system dependencies (curl, git, xz-utils)..."
apt-get update && apt-get install -y curl git xz-utils coreutils

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

# 5. Source environment
export PATH="$HOME/.local/bin:$PATH"
source ~/.bashrc

# 6. Trigger Interactive Setup
echo "Launching interactive configuration wizard..."
hermes setup

# 7. Start in background automatically
echo "Launching Hermes Agent in the background via nohup..."
nohup hermes start > $HOME/hermes_agent.log 2>&1 &

echo ""
echo "SETUP COMPLETE!"
echo "Open Telegram on your phone and message your bot now."
echo "To view live agent logs, type: tail -f $HOME/hermes_agent.log"
