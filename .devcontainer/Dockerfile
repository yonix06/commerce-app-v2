FROM mcr.microsoft.com/devcontainers/typescript-node:dev-22-bookworm

# Setup yarn
RUN corepack enable

# Install tslint, typescript. eslint is installed by javascript image
ARG NODE_MODULES="nx tsx ts-node dbgate-serve"
RUN yarn global add ${NODE_MODULES} \
    && yarn cache clean --all > /dev/null 2>&1
RUN apt-get update && apt-get install -y postgresql-common curl ca-certificates

# Add sources for additionnal packages: PostgreSQL, pgAdmin, Redis, Webdis
RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update

# Install additional OS packages.
RUN sudo curl -sL https://raw.githubusercontent.com/axllent/mailpit/develop/install.sh | sh
RUN sudo curl -o- "https://dl-cli.pstmn.io/install/linux64.sh" | sh

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
