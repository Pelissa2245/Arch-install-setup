#!/bin/bash

# Install Plasma Desktop Environment on Arch Linux
sudo pacman -Sy --noconfirm plasma

# Install sddm Display manager
sudo pacman -Sy --noconfirm sddm

# Install KDE applications
sudo pacman -Sy --noconfirm kde-applications

# Enable sddm service
sudo systemctl enable --now sddm.service
