#!/bin/bash

sudo pacman -Syu

sudo pacman -S xfce4 --noconfirm
sudo pacman -S xfce4-goodies --noconfirm

sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm
sudo systemctl enable --now lightdm.service
