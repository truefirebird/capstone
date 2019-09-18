#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=testblueimage

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username anandraman7978 -p ------
docker tag testblueimage anandraman7978/testblueimage
# Step 3:
# Push image to a docker repository
docker push anandraman7978/testblueimage
