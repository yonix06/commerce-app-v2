#!/bin/bash

# Update yarn to the latest version
cd .. | yarn set version canary && yarn install

# Install Medusa CLI globally using Yarn
cd .. | yarn global add @medusajs/medusa-cli
