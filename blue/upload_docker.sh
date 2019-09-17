#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=testbimage

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username anandraman7978 -p Panther@12
docker tag testbimage anandraman7978/testbimage
# Step 3:
# Push image to a docker repository
docker push anandraman7978/testbimage
