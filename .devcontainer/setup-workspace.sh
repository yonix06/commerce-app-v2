#!/bin/bash

# Update yarn to the latest version
yarn set version canary && yarn install

# Install Medusa CLI globally using Yarn
# yarn global add @medusajs/medusa-cli

# Create a new Nx workspace for Medusa apps using Yarn and disable interactive mode
# nx init
