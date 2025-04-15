#!/bin/bash

flatpak update

# Install OBS Studio
flatpak install -y flathub com.obsproject.Studio

# Install Sober
flatpak install -y flathub org.vinegarhq.Sober

# Install Steam
flatpak install -y flathub com.valvesoftware.Steam

# Install Nextcloud
flatpak install -y flathub com.nextcloud.desktopclient.nextcloud


