FROM node:23-bookworm

# Setup yarn
RUN corepack enable

# Install tslint, typescript. eslint is installed by javascript image
ARG NODE_MODULES="tslint-to-eslint-config typescript tsx ts-node yarn"
RUN yarn global add ${NODE_MODULES} \
    && yarn cache clean --all > /dev/null 2>&1
RUN apt-get update && apt-get install -y postgresql-common curl ca-certificates

# Add sources for additionnal packages: PostgreSQL, pgAdmin, Redis, Webdis
RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/sury-php.list && wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
RUN echo "deb https://packages.redis.io/deb $(lsb_release -sc) main" > /etc/apt/sources.list.d/redis.list && curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -sc) main" > /etc/apt/sources.list.d/redis.list && apt update

# Install additional OS packages.
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install git openssh-client gnupg2 apt-transport-https software-properties-common gnupg lsb-release \
    redis webdis libpq5 postgresql-17 postgresql-client postgresql-client-common \
    && apt-get autoremove -y
RUN curl -sL https://raw.githubusercontent.com/axllent/mailpit/develop/install.sh | sh
RUN curl -o- "https://dl-cli.pstmn.io/install/linux64.sh" | sh
RUN wget https://github.com/dbgate/dbgate/releases/latest/download/dbgate-latest.deb
RUN dpkg -i dbgate-latest.deb


# [Optional] Uncomment if you want to install an additional version of node using nvm
# ARG EXTRA_NODE_VERSION=10
# RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install ${EXTRA_NODE_VERSION}"

# Enable Dev Services
RUN systemctl enable redis-server postgresql mailpit && systemctl start redis-server postgresql mailpit

# Install more global node packages
RUN yarn global add nx@latest
