#!/bin/bash

# Variables
AWS_REGION="eu-north-1"
ACCOUNT_ID="120430499693"           # replace with your AWS account ID
ECR_REPO="demonuxtproject0135"
IMAGE_NAME="demo-nuxt"
TAG="latest"

# 1. AWS ECR login
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# 2. Build Docker image
docker build -t $IMAGE_NAME:$TAG .

# 3. Tag image for ECR
docker tag $IMAGE_NAME:$TAG $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$TAG

# 4. Push image to ECR
docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$TAG

echo "Docker image pushed successfully to ECR!"
