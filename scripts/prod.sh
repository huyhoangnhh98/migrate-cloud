#!/bin/bash
NAMESPACE="app"
kubectl config set-context --current --namespace=$NAMESPACE

REPO_URL="https://github.com/huyhoangnhh98/app-deployment"
REPO_DIR="app-deployment"

if [ -d "$REPO_DIR" ]; then
    rm -rf "$REPO_DIR"
fi

git clone $REPO_URL

RELEASE_NAME="example-node-app"
IMAGE_REPOSITORY="registry-prod/example-node-app-prod"
IMAGE_TAG="latest"

helm upgrade --install $RELEASE_NAME ./$REPO_DIR --set image.repository=$IMAGE_REPOSITORY --set image.tag=$IMAGE_TAG

echo "Deployment to prod environment completed."