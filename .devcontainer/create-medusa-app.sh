#!/bin/bash

# Update yarn to the latest version
# npm install -g yarn

# Install Medusa CLI globally using Yarn
# yarn global add @medusajs/medusa-cli

# Create a new Nx workspace for Medusa apps using Yarn and disable interactive mode
# nx init

# Create a new Medusa app using Medusa CLI with the specified name and starter URL, and disable interactive mode
# medusa new driptimez https://github.com/tinloof/medusa-b2c-starter -y --v2
npx create-medusa-app@latest --repo-url https://github.com/tinloof/medusa-b2c-starter --with-nextjs-starter --v2 --verbose

# Install dependencies and initialize the Medusa app using Yarn
# cd driptimez || exit
# yarn install
# medusa migrations run

# Add the newly created folders to the Nx workspace using Yarn and disable interactive mode
# nx generate @nx/workspace:lib --name=driptimez --directory=apps/driptimez --tags=scope:driptimez --packageManager=yarn --no-interactive
# nx generate @nx/workspace:lib --name=storefront --directory=apps/storefront --tags=scope:storefront --packageManager=yarn --no-interactive

echo "Medusa app 'driptimez' and storefront have been created and initialized successfully!"