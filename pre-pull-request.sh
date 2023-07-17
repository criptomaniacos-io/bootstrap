#!/bin/bash

# Obtém a versão atual do arquivo package.json
current_version=$(node -pe "require('./package.json').version")

# Separa a versão atual em três variáveis (X, Y e Z)
IFS='.' read -r x y z <<< "$current_version"

# Calcula as versões de destino para cada tipo de atualização
nX=$((x + 1))
nY=$((y + 1))
nZ=$((z + 1))

# Exibe a versão atual e as opções de atualização
echo "Versão atual: $current_version"
echo "Opções de atualização:"
echo "1. Atualização majoritária ($nX.0.0)"
echo "2. Upgrade com compatibilidade ($x.$nY.0)"
echo "3. Correções menores ($x.$y.$nZ)"

# Solicita o tipo de atualização
read -p "Digite o número correspondente à opção desejada: " update_type

# Atualiza a versão de acordo com o tipo selecionado
case $update_type in
    1)
        new_version="${nX}.0.0" # Atualização majoritária (X.0.0)
        update_file="major.md"
        ;;
    2)
        new_version="${x}.${nY}.0" # Upgrade com compatibilidade (X.Y.0)
        update_file="minor.md"
        ;;
    3)
        new_version="${x}.${y}.${nZ}" # Correções menores (X.Y.Z)
        update_file="bugfix.md"
        ;;
    *)
        echo "Opção inválida. Saindo."
        exit 1
        ;;
esac

# Solicita uma frase que resume as alterações feitas pelo desenvolvedor
read -p "Digite uma frase que resume as alterações: " update_phrase

# Verifica se a pasta "changelog" existe e cria caso contrário
if [[ ! -d "changelog" ]]; then
    mkdir "changelog"
fi

# Atualiza a versão no arquivo package.json
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/\"version\": \"$current_version\"/\"version\": \"$new_version\"/" package.json
else
    sed -i "s/\"version\": \"$current_version\"/\"version\": \"$new_version\"/" package.json
fi

# Salva a frase e a versão no arquivo correspondente
echo "- $new_version: $update_phrase" >> "changelog/$update_file"

echo "Versão atualizada para: $new_version"

git add .
git commit -m "`$new_version`: $update_phrase"