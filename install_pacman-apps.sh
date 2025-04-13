#!/bin/bash
# This script installs some commonly used applications on Arch Linux using yay, flatpak, and pacman.

# Update the system
sudo pacman -Syu

# Install Libre Office
sudo pacman -S libreoffice-fresh

# Install nano
sudo pacman -S nano

# Install neofetch
sudo pacman -S neofetch

# Install htop
sudo pacman -S htop

# Install python
sudo pacman -S python

# Install tmux
sudo pacman -Sy tmux