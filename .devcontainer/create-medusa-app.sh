#!/bin/bash

# Create a new Medusa app using Medusa CLI with the specified name and starter URL, and disable interactive mode
# medusa new driptimez https://github.com/tinloof/medusa-b2c-starter -y --v2

yarn create medusa-app@latest --verbose

# Install dependencies and initialize the Medusa app using Yarn
# cd driptimez || exit
# yarn install
# medusa migrations run

# Add the newly created folders to the Nx workspace using Yarn and disable interactive mode
# nx generate @nx/workspace:lib --name=driptimez --directory=apps/driptimez --tags=scope:driptimez --packageManager=yarn --no-interactive
# nx generate @nx/workspace:lib --name=storefront --directory=apps/storefront --tags=scope:storefront --packageManager=yarn --no-interactive

echo "Medusa app 'driptimez' and storefront have been created and initialized successfully!"