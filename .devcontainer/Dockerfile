ARG BASE_IMAGE="mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm"
FROM $BASE_IMAGE

# Setup yarn
RUN corepack enable
ARG NODE_MODULES="nx tsx ts-node dbgate-serve prettier eslint lodash json-stable-stringify debug dbgate-api dbgate-plugin-csv dbgate-plugin-excel dbgate-plugin-mongo dbgate-plugin-mssql dbgate-plugin-mysql dbgate-plugin-postgres dbgate-plugin-xml dbgate-web dotenv moment typescript tslint"

# Install NODE_MODULES globally
RUN apt-get update && apt-get install -y postgresql-common curl ca-certificates
RUN yarn global add ${NODE_MODULES} \
    && yarn cache clean --all > /dev/null 2>&1


# Add sources for additionnal packages: PostgreSQL, pgAdmin, Redis, Webdis
RUN sudo echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
RUN apt-get update

# Install additional OS packages.
RUN sudo curl -sL https://raw.githubusercontent.com/axllent/mailpit/develop/install.sh | sudo sh
RUN sudo tee /etc/systemd/system/mailpit.service > /dev/null <<EOT
[Unit]
Description=Mailpit server

[Service]
ExecStart=/usr/local/bin/mailpit -d /var/lib/mailpit/mailpit.db
Restart=always
RestartSec=10
SyslogIdentifier=mailpit
User=mailpit
Group=mailpit

[Install]
WantedBy=multi-user.target
EOT

# Create the Mailpit database directory
RUN mkdir -p /var/lib/mailpit


RUN sudo curl -o- "https://dl-cli.pstmn.io/install/linux64.sh" | sudo sh

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install git openssh-client gnupg2 apt-transport-https software-properties-common gnupg lsb-release \
    redis webdis libpq5 postgresql-17 postgresql-client postgresql-client-common \
    && apt-get autoremove -y

# [Optional] Uncomment if you want to install an additional version of node using nvm
# ARG EXTRA_NODE_VERSION=10
# RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install ${EXTRA_NODE_VERSION}"

# Enable Dev Services
RUN systemctl enable redis-server postgresql mailpit && systemctl start redis-server postgresql mailpit

# Install more global node packages
#RUN yarn global add nx@latest
