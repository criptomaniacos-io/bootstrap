#!/bin/bash

# Função para instalar as dependências com pnpm
install_dependencies() {
    echo "Instalando as dependências com pnpm..."
    pnpm install \
        --save-dev @typescript-eslint/eslint-plugin@5.59.11 \
    @typescript-eslint/parser@5.59.11 \
    prettier-plugin-tailwindcss@0.3.0 \
    eslint-config-prettier@8.8.0 \
    eslint-config-standard@17.1.0 \
    eslint-plugin-import@2.27.5 \
    eslint-plugin-jsx-a11y@6.7.1 \
    eslint-plugin-n@16.0.0 \
    eslint-plugin-prettier@4.2.1 \
    eslint-plugin-promise@6.1.1 \
    eslint-plugin-react@7.32.2 \
    eslint-plugin-react-hooks@4.6.0
    echo "Dependências instaladas com sucesso."
}

# Função para baixar os arquivos do Gist usando o wget
download_files() {
    echo "Baixando os arquivos do Gist..."
    wget https://raw.githubusercontent.com/gustavofbc/frontend/main/.eslintrc.js -O .eslintrc.js
    wget https://raw.githubusercontent.com/gustavofbc/frontend/main/.editorconfig -O .editorconfig
    wget https://raw.githubusercontent.com/gustavofbc/frontend/main/prettier.config.js -O prettier.config.js
    echo "Arquivos baixados com sucesso."
}

# Executar as etapas do setup
install_dependencies
download_files

echo "Setup concluído com sucesso."
