#!/bin/bash

# Update yarn to the latest version
cd .. | yarn set version canary && yarn install --immutable

# Install Medusa CLI globally using Yarn
cd .. | yarn add @medusajs/medusa-cli

# Install & Start Tilt
curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash
cd .. | tilt up

# Start redis
redis-server

# Postgres config
LANGUAGE = en_US.UTF-8
LC_ALL = en_US.UTF-8
LANG = en_US.UTF-8
echo "listen_addresses = '*'" | tee -a /etc/postgresql/17/main/postgresql.conf 
sed -i '/^host/s/ident/md5/' /etc/postgresql/17/main/pg_hba.conf
sed -i '/^local/s/peer/trust/' /etc/postgresql/17/main/pg_hba.conf
echo "host all all 0.0.0.0/0 md5" | tee -a /etc/postgresql/17/main/pg_hba.conf
# ufw allow 5432/tcp
service postgresql restart
psql
ALTER USER postgres PASSWORD 'VeryStronGPassWord@1137';
exit