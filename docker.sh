#!/bin/bash

# Set variables (replace with your values)
SOURCE_IMAGE="hashicorp/terraform:latest"  # URL of the source image to pull
ARTIFACT_REGISTRY="us-central1-docker.pkg.dev"  # Artifact Registry location
PROJECT_ID="project-1-sandbox-1223"
REPOSITORY_NAME="docker-repo"
IMAGE_NAME="terraform-cloudbuild-image"

# Authenticate for Artifact Registry
gcloud auth configure-docker ${ARTIFACT_REGISTRY}

# Pull the source image
docker pull ${SOURCE_IMAGE}

# Use builder instance
docker buildx use dockerbuilder

# Adjust architecture to desired platform 
docker buildx build --platform linux/amd64 \
--push ${ARTIFACT_REGISTRY}/${PROJECT_ID}/${REPOSITORY_NAME}/${IMAGE_NAME}
--tag  ${ARTIFACT_REGISTRY}/${REPOSITORY_NAME}/${IMAGE_NAME}:${SOURCE_IMAGE} . &&

echo "Image pushed to Artifact Registry!" || echo "Image build or push failed."
