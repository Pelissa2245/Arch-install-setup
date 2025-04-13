#!/bin/bash

sudo pacman -Syu

sudo pacman -S xfce4
sudo pacman -S xfce4-goodies

sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable --now lightdm.service
