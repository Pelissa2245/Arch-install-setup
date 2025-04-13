#!/bin/bash

# This script installs the GNOME desktop environment on Arch Linux and its derivatives.

sudo pacman -Syu

sudo pacman -S gnome gnome-extra gnome-shell
sudo pacman -S gdm
sudo systemctl enable --now gdm.service