#!/bin/bash

# This script installs yay, a popular AUR helper for Arch Linux and its derivatives.

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd ..
rm -rf yay-bin
echo "yay has been installed successfully."