#!/bin/bash

# Update yarn to the latest version
cd .. | yarn set version canary && yarn install --immutable

# Install Medusa CLI globally using Yarn
#cd .. | yarn add -D @medusajs/medusa-cli

# It's better when it's set up. And yes, uses zsh.
cp .p10k.zsh ~/
cp .zshrc ~/
source ~/.zshrc

# Dev on WSL2 / Need sudo on Ubuntu
chmod 777 -R ../appdata
chmod 777 -R ../devdata

## Install & Start Tilt
#curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash
#cd .. | tilt up

# Start redis if installed via devcontainer feature
#redis-server

### Postgres config for local dev with the devcontainer feature, replace xx by your version.
##set LANGUAGE = en_US.UTF-8
##set LC_ALL = en_US.UTF-8
##set LANG = en_US.UTF-8
### 
##echo "listen_addresses = '*'" | tee -a /etc/postgresql/xx/main/postgresql.conf 
##sed -i '/^host/s/ident/md5/' /etc/postgresql/xx/main/pg_ident.conf
##sed -i '/^local/s/peer/trust/' /etc/postgresql/xx/main/pg_hba.conf
##echo "host all all 0.0.0.0/0 md5" | tee -a /etc/postgresql/xx/main/pg_hba.conf
### ufw allow 5432/tcp
##service postgresql restart
##psql
##ALTER USER postgres PASSWORD 'VeryStronGPassWord@1137';
##exit