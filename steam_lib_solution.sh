#!/bin/bash

# Pede ao usuário o dispositivo do SSD
read -rp "Digite o caminho do dispositivo do SSD (ex: /dev/sda1): " DISPOSITIVO

# Verifica se o dispositivo existe
if [ ! -b "$DISPOSITIVO" ]; then
  echo "❌ Dispositivo inválido. Verifique se o caminho está correto (ex: /dev/sda1)."
  exit 1
fi

# Cria o ponto de montagem
sudo mkdir -p /mnt/ssd

# Monta temporariamente
sudo mount "$DISPOSITIVO" /mnt/ssd

# Descobre o UUID do SSD
UUID=$(blkid -s UUID -o value "$DISPOSITIVO")

# Tipo de sistema de arquivos (ext4 é o mais comum)
TIPO_FS=$(blkid -s TYPE -o value "$DISPOSITIVO")

# Verifica se já existe no fstab
if grep -q "$UUID" /etc/fstab; then
  echo "→ Já existe uma entrada no /etc/fstab para esse dispositivo."
else
  # Adiciona a entrada no /etc/fstab
  echo "UUID=$UUID /mnt/ssd $TIPO_FS defaults,noatime 0 2" | sudo tee -a /etc/fstab
  echo "→ Entrada adicionada ao /etc/fstab com sucesso!"
fi

# Corrige o problema da Steam Flatpak
echo "✅ Corrigindo a permissão da Steam Flatpak para acessar /mnt/ssd..."
flatpak override --user --filesystem=/mnt/ssd com.valvesoftware.Steam

echo "✔️ Tudo pronto! O SSD será montado automaticamente e a Steam poderá usá-lo."
