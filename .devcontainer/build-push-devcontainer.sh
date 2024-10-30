#! /bin/sh

# Build the image and push to Docker Hub

docker buildx build -t yonix06/medusajs-devcontainer:latest --push .

