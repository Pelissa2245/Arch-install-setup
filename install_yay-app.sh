#!/bin/bash

# Atualiza o sistema (yay + pacman) sem confirmação
yay -Syu --noconfirm

# Instala o preload e habilita o serviço
yay -S --needed --noconfirm preload
sudo systemctl enable --now preload

# Atualiza novamente (caso preload tenha alterado algo)
yay -Syu --noconfirm

# Instala o Google Chrome
yay -S --needed --noconfirm google-chrome

# Instala o Visual Studio Code (versão oficial .deb repack)
yay -S --needed --noconfirm visual-studio-code-bin

# Instala o Discord
yay -S --needed --noconfirm discord

# Instala o Notepad++ (notepadqq é a alternativa para Linux)
yay -S --needed --noconfirm notepadqq
