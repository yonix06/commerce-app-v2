#!/bin/bash

# Create a new Medusa app using Medusa CLI with the specified name and starter URL, and disable interactive mode
# medusa new driptimez https://github.com/tinloof/medusa-b2c-starter -y --v2

cd .. | yarn add -D @medusajs/telemetry fs-exists-cached
cd .. | yarn create medusa-app@latest --directory-path ./apps --verbose --db-url postgres://postgres:password@store-database:5432

# Install dependencies and initialize the Medusa app using Yarn
# cd store || exit
# yarn install
# medusa migrations run

# Add the newly created folders to the Nx workspace using Yarn and disable interactive mode
# nx generate @nx/workspace:lib --name=driptimez --directory=apps/driptimez --tags=scope:driptimez --packageManager=yarn --no-interactive
# nx generate @nx/workspace:lib --name=storefront --directory=apps/storefront --tags=scope:storefront --packageManager=yarn --no-interactive

echo "Medusa app 'store' and it's storefront have been created and initialized successfully!"