#! /bin/sh

# Build the image and push to Docker Hub

docker buildx build -t yonix06/medusajs-devcontainer:latest --push .

# Install devcontainer via Node.js

npm install -g @devcontainers/cli

# Run the devcontainer with devcontainers/cli

devcontainer up --workspace-folder ../

