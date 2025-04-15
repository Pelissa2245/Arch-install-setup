#!/bin/bash

# Caminho do diretório atual
DIR=$(dirname "$0")

# Dá permissão de execução ao give_permissions_all.sh
chmod +x "$DIR/give_permissions_all.sh"

# Verifica se o fzf está instalado, senão instala com pacman
if ! command -v fzf &>/dev/null; then
    echo "🔧 'fzf' não está instalado. Instalando via pacman..."
    sudo pacman -Sy --noconfirm fzf
fi

# Lista os scripts disponíveis, excluindo os que não devem ser executados
SCRIPTS=($(find "$DIR" -maxdepth 1 -type f -name "*.sh" ! -name "setup.sh" ! -name "give_permissions_all.sh" | sort))

# Se nenhum script for encontrado
if [ ${#SCRIPTS[@]} -eq 0 ]; then
    echo "Nenhum script disponível para executar."
    exit 0
fi

# Interface interativa com múltipla seleção via fzf
SELECTED=$(printf "%s\n" "${SCRIPTS[@]}" | fzf --multi --prompt="Selecionar scripts para executar: " --height=40%)

# Se nada foi selecionado
if [ -z "$SELECTED" ]; then
    echo "Nenhum script selecionado."
    exit 0
fi

# Executa os scripts selecionados um por um
echo "Executando os scripts selecionados..."
while IFS= read -r SCRIPT; do
    echo -e "\n🚀 Executando: $SCRIPT\n"
    bash "$SCRIPT"
done <<< "$SELECTED"
