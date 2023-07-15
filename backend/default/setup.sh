#!/bin/bash
rm -rf node_modules
npm cache clean --force

curl -o .editorconfig https://raw.githubusercontent.com/criptomaniacos-io/bootstrap/main/backend/default/.editorconfig
curl -o .eslintrc.js https://raw.githubusercontent.com/criptomaniacos-io/bootstrap/main/backend/default/.eslintrc.js
curl -o .prettierrc https://raw.githubusercontent.com/criptomaniacos-io/bootstrap/main/backend/default/.prettierrc
curl -o esbuild.js https://raw.githubusercontent.com/criptomaniacos-io/bootstrap/main/backend/default/esbuild.js
curl -o tsconfig.json https://raw.githubusercontent.com/criptomaniacos-io/bootstrap/main/backend/default/tsconfig.json 
curl -o .nvmrc https://raw.githubusercontent.com/criptomaniacos-io/bootstrap/main/backend/default/.nvmrc
curl -o .npmrc https://raw.githubusercontent.com/criptomaniacos-io/bootstrap/main/backend/default/.npmrc
curl -o .gitignore https://raw.githubusercontent.com/criptomaniacos-io/bootstrap/main/backend/default/.gitignore 

npm install --save-dev eslint eslint-plugin-import@latest @typescript-eslint/eslint-plugin @typescript-eslint/parser @typescript-eslint/typescript-estree eslint-config-prettier eslint-plugin-prettier prettier tsconfig-paths typescript@4.9.5 esbuild

npx eslint --ext .ts src
rm setup.sh