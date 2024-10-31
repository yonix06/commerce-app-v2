#! /bin/sh

# Build the image and push to Docker Hub
docker buildx build -f Dockerfile.ubernode -t yonix06/dev:node23-yarn4 --push .
docker buildx build -f Dockerfile.dev -t yonix06/dev:devcontainer-db --push .

