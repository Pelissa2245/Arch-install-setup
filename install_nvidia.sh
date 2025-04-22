#!/bin/bash

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings opencl-nvidia xorg-server-devel

mkdir -p /etc/X11/xorg.conf.d

cat >> /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf<<EOF
Section "OutputClass"
    Identifier "intel"
    MatchDriver "i915"
    Driver "modesetting"
EndSection

Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
    Option "PrimaryGPU" "yes"
    ModulePath "/usr/lib/nvidia/xorg"
    ModulePath "/usr/lib/xorg/modules"
EndSection
EOF

mkdir -p /etc/modprobe.d

cat >> /etc/modprobe.d/nvidia-drm-nomodeset.conf<<EOF
options nvidia-drm modeset=1
EOF

sudo mkinitcpio -P

