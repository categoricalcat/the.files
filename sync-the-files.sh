#! /usr/bin/env bash

echo "Permission level: Root user"
echo "User ID: $(id -u)"
echo "Username: $(whoami)"

echo "Stowing files..."
stow -v -R -t ~ .

echo "Sourcing .zshrc..."
source ~/.zshrc

echo ":3"