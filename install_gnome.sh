#!/bin/bash

# This script installs the GNOME desktop environment on Arch Linux and its derivatives.

sudo pacman -Syu --noconfirm

sudo pacman -S gnome gnome-extra gnome-shell --noconfirm
sudo pacman -S gdm --noconfirm
sudo systemctl enable --now gdm.service
