#!/bin/bash

yay -Syu

yay -S preload
sudo systemctl enable --now preload

yay -Syu

# Install Google Chorome
yay -S google-chrome

# Install Visual Studio Code
yay -S visual-studio-code-bin

# Install Discord
yay -S discord

# Install notepad++
yay -S notepad++

# Install Ventoy
yay -S ventoy-bin