#!/bin/bash

# Update yarn to the latest version
yarn set version canary && yarn install --immutable

# Install Medusa CLI globally using Yarn
yarn add @medusajs/medusa-cli

# Start Tilt
tilt up
