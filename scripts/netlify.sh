#!/bin/bash

set -e

echo "--------------------------------------------------"
echo "1 - Install SecretHub"
echo "--------------------------------------------------"

mkdir -p ./secrethub
wget --quiet https://github.com/secrethub/secrethub-cli/releases/download/v0.37.0/secrethub-v0.37.0-linux-amd64.tar.gz
tar -zxvf secrethub-v0.37.0-linux-amd64.tar.gz -C ./secrethub
chmod +x secrethub/bin/secrethub
rm secrethub-v0.37.0-linux-amd64.tar.gz
export PATH="$PWD/secrethub/bin:$PATH"

echo "--------------------------------------------------"
echo "2 - Load secrets"
echo "--------------------------------------------------"

secrethub inject --var env=$(APP_ENV) -i secrethub.env -o .env

echo "--------------------------------------------------"
echo "3 - Build"
echo "--------------------------------------------------"

yarn build