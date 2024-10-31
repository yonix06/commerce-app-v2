#! /bin/sh

# Build the image and push to Docker Hub
docker buildx build -f Dockerfile.ubernode -t yonix06/ubernode:23 --push .
docker buildx build -f Dockerfile.dev -t yonix06/typescript-devcontainer:latest --push .

