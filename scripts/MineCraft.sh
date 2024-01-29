#!/bin/bash

# Set variables
SOURCE_IMAGE= "itzg/minecraft-server:latest"  # URL of the source image to pull
ARTIFACT_REGISTRY= "us-central1-docker.pkg.dev"  # Artifact Registry location
PROJECT_ID= "project-1-sandbox-1223"
REPOSITORY_NAME= "docker-repo"
IMAGE_NAME= "mine-craft"

# Authenticate for Artifact Registry
gcloud auth configure-docker ${ARTIFACT_REGISTRY}

# Pull the source image
docker pull ${SOURCE_IMAGE} --platform linux/amd64

docker tag  ${SOURCE_IMAGE} ${ARTIFACT_REGISTRY}/${PROJECT_ID}/${REPOSITORY_NAME}/${IMAGE_NAME}

docker push ${ARTIFACT_REGISTRY}/${PROJECT_ID}/${REPOSITORY_NAME}/${IMAGE_NAME}  &&

echo "Image pushed to Artifact Registry!" || echo "Image build or push failed."