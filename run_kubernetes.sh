#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=russelmusas/sklearn-api:v1.0.0

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy sklearn-api --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/sklearn-api --address 0.0.0.0 8000:80
