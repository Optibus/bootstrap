#!/bin/bash
OS=$(uname)

install_nix() {
    if command -v "nix" &> /dev/null; then
        echo "Nix is available. Skipping installation"
    else
        echo "Nix is not available. Installing Nix..."
        if [ "$OS" = "Darwin" ]; then
            echo "This script is running on macOS"
        elif [ "$OS" = "Linux" ]; then
            echo "This script is running on Linux"
            sudo apt-get update
            sudo apt-get install -qq -y --no-install-recommends curl
        fi
        curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
        [ -f /etc/bashrc ] && sudo mv /etc/bashrc /etc/bashrc.before-nix
        [ -f /etc/zshrc ] && sudo mv /etc/zshrc /etc/zshrc.before-nix
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    fi
}
install_nix

curl -sSL https://raw.githubusercontent.com/Optibus/bootstrap/refs/heads/main/download.sh -o download.sh && chmod +x download.sh && ./download.sh && rm download.sh

