#! /bin/sh

# Build the images and push to Docker Hub
docker buildx build -f Dockerfile.ubernode -t yonix06/dev:node23-yarn4 --push .

echo "Node23-yarn4 image built and pushed to Docker Hub"

docker buildx build -f Dockerfile.dev -t yonix06/dev:devcontainer --push .

echo "Devcontainer-db image built and pushed to Docker Hub"