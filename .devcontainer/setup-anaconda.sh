#!/bin/bash

set -e

INSTALL_DIR="/workspaces/mlops-zoomcamp/anaconda3"

# Skip install if already present
if [ -d "$INSTALL_DIR" ]; then
  echo "✅ Anaconda already installed at $INSTALL_DIR"
  exit 0
fi

echo "⬇️ Downloading Anaconda installer..."
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh -O ~/anaconda.sh

echo "💾 Installing Anaconda..."
bash ~/anaconda.sh -b -p "$INSTALL_DIR"

echo "🧼 Cleaning up installer..."
rm ~/anaconda.sh

echo "🔁 Updating PATH..."
echo "export PATH=\"$INSTALL_DIR/bin:\$PATH\"" >> ~/.bashrc
source ~/.bashrc

echo "✅ Anaconda installation complete."
