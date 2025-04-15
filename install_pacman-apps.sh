#!/bin/bash
# This script installs some commonly used applications on Arch Linux using yay, flatpak, and pacman.

# Update the system without confirmation
sudo pacman -Syu --noconfirm

# Install LibreOffice (fresh version)
sudo pacman -S --needed --noconfirm libreoffice-fresh

# Install nano
sudo pacman -S --needed --noconfirm nano

# Install neofetch
sudo pacman -S --needed --noconfirm neofetch

# Install htop
sudo pacman -S --needed --noconfirm htop

# Install python
sudo pacman -S --needed --noconfirm python

# Install tmux
sudo pacman -S --needed --noconfirm tmux
