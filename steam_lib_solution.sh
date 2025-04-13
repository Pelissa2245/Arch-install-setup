#!/bin/bash

# Defina aqui o dispositivo do seu SSD (ex: /dev/sdb1)
DISPOSITIVO="/dev/sda1"

# Cria o ponto de montagem
sudo mkdir -p /mnt/ssd

# Monta temporariamente
sudo mount $DISPOSITIVO /mnt/ssd

# Descobre o UUID do SSD
UUID=$(blkid -s UUID -o value $DISPOSITIVO)

# Tipo de sistema de arquivos (ext4 é o mais comum)
TIPO_FS=$(blkid -s TYPE -o value $DISPOSITIVO)

# Verifica se já existe no fstab
if grep -q "$UUID" /etc/fstab; then
  echo "→ Já existe uma entrada no /etc/fstab para esse dispositivo."
else
  # Adiciona a entrada no /etc/fstab
  echo "UUID=$UUID /mnt/ssd $TIPO_FS defaults,noatime 0 2" | sudo tee -a /etc/fstab
  echo "→ Entrada adicionada ao /etc/fstab com sucesso!"
fi

echo "This code will fix the steam library issue on Arch Linux."
flatpak override --user --filesystem=/mnt/ssd com.valvesoftware.Steam
