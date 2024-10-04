#!/bin/bash

 echo "Installing Nix..."
 echo "This script is running on macOS"
 mkdir -p ~/.config/nix-darwin
 curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
 sudo mv /etc/bashrc /etc/bashrc.before-nix
 sudo mv /etc/zshrc /etc/zshrc.before-nix
 . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
 
 curl -sSL https://raw.githubusercontent.com/Optibus/bootstrap/refs/heads/main/download.sh -o download.sh && chmod +x download.sh && ./download.sh && rm download.sh

