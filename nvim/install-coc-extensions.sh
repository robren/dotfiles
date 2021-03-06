#!/usr/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
# Change extension names to the extensions you need
npm install coc-python coc-vimlsp coc-go  coc-json coc-yaml coc-markdownlint --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
