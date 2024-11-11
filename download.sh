#!/usr/bin/env nix-shell
#! nix-shell -i bash --pure
#! nix-shell -p git curl openssh
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/2a601aafdc5605a5133a2ca506a34a3a73377247.tar.gz

git --version

if [ ! -d ~/dev ]; then
    echo "Creating ~/dev directory..."
    mkdir -p ~/dev
fi

if [ -f ~/.ssh/id_ed25519.pub ]; then
  echo "Public SSH key already exist in ~/.ssh/id_ed25519.pub". Trying to use it....
else
  echo "Public SSH key not found. Check the readme for further instructions"
  exit 1
fi
git clone git@github.com:Optibus/optishell.git ~/dev/optishell

echo "All set! Now navigate to ~/dev/optishell and follow the instructions in the README.md file"
