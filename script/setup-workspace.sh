#!/bin/bash

# Update yarn to the latest version
cd .. | yarn set version canary && yarn install --immutable

# Install Medusa CLI globally using Yarn
cd .. | yarn add @medusajs/medusa-cli

# Start Tilt
cd .. | tilt up
