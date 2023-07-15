#!/bin/bash
rm -rf node_modules
npm cache clean --force

curl -o .editorconfig https://gist.githubusercontent.com/isacrodriguesdev/86b5b247b25a8cd5fdf694812bf032b1/raw/.editorconfig
curl -o .eslintrc.js https://gist.githubusercontent.com/isacrodriguesdev/7ebd934130e0a8ab83e96ee37548203e/raw/.eslintrc.js
curl -o .prettierrc https://gist.githubusercontent.com/isacrodriguesdev/0ce9cbf81c6a5f63b97ee81bc9fd2721/raw/.prettierrc
curl -o esbuild.js https://gist.githubusercontent.com/isacrodriguesdev/14232edc3ebb3225bdee1ed4cbbb9361/raw/esbuild.js
curl -o tsconfig.json https://gist.githubusercontent.com/isacrodriguesdev/c5049638cce57a1dfe0e1552534565fc/raw/tsconfig.json
curl -o .nvmrc https://gist.githubusercontent.com/isacrodriguesdev/a6a2a22c6a277b4f76be68c1ec8df889/raw/.nvmrc
curl -o .gitignore https://gist.githubusercontent.com/isacrodriguesdev/86ebf408064a04a0b38565cc6d99cdbc/raw/.gitignore

npm install --save-dev eslint eslint-plugin-import@latest @typescript-eslint/eslint-plugin @typescript-eslint/parser @typescript-eslint/typescript-estree eslint-config-prettier eslint-plugin-prettier prettier tsconfig-paths typescript@4.9.5 esbuild

npx eslint --ext .ts src
rm setup.sh