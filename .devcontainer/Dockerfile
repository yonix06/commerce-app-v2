ARG BASE_IMAGE="node:22-bookworm"
FROM $BASE_IMAGE

WORKDIR /

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV YARN_VERSION canary

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Setup yarn
RUN corepack enable
RUN yarn policies set-version $YARN_VERSION
RUN curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
    && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
    && rm yarn-v$YARN_VERSION.tar.gz

# Install NODE_MODULES globally
ARG NODE_MODULES="tsx ts-node dbgate-serve prettier eslint lodash json-stable-stringify debug dbgate-api dbgate-plugin-csv dbgate-plugin-excel dbgate-plugin-mongo dbgate-plugin-mssql dbgate-plugin-mysql dbgate-plugin-postgres dbgate-plugin-xml dbgate-web dotenv moment typescript tslint"
RUN apt-get update && apt-get install -y postgresql-common curl ca-certificates
RUN yarn global add ${NODE_MODULES} \
    && yarn cache clean --all > /dev/null 2>&1


# Add sources for additionnal packages: PostgreSQL, pgAdmin, Redis, Webdis
#RUN sudo echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
#    curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
#RUN apt-get update

# Install additional OS packages.
RUN curl -sL https://raw.githubusercontent.com/axllent/mailpit/develop/install.sh | sh
RUN tee /etc/systemd/system/mailpit.service > /dev/null <<EOT
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

# Set the correct permissions for the Mailpit database directory
RUN chown -R mailpit:mailpit /var/lib/mailpit

# Install PostmanCLI
RUN curl -o- "https://dl-cli.pstmn.io/install/linux64.sh" | sh

# Install additional OS packages.
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install git openssh-client apt-transport-https software-properties-common gnupg lsb-release \
    redis webdis libpq5 postgresql-17 postgresql-client postgresql-client-common \
    && apt-get autoremove -y

# [Optional] Uncomment if you want to install an additional version of node using nvm
# ARG EXTRA_NODE_VERSION=10
# RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install ${EXTRA_NODE_VERSION}"

# Reload systemd to pick up the new service
RUN systemctl daemon-reload

# Enable Dev Services
RUN systemctl enable redis-server postgresql mailpit && systemctl start redis-server postgresql mailpit

# Install more global node packages
RUN yarn global add nx@latest @medusajs/medusa-cli

#dbgate mailpit postgresql dbgate redis medusajs storefront# mailpit ui medusajs backend api redis ui medusajs backend+admin
EXPOSE 3000
EXPOSE 1025
EXPOSE 5432
EXPOSE 3000
EXPOSE 6379
EXPOSE 8000
EXPOSE 8025
EXPOSE 7001
EXPOSE 7379
EXPOSE 9000

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set entrpoint script
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

#
CMD [ "node" ]