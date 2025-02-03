#!/bin/bash

# Set variables
IMAGE_NAME="crud-api:latest"
POD_NAME="mypod"
MYSQL_CONTAINER="mydb"
MYSQL_ROOT_PASSWORD="1234"
MYSQL_DATABASE="testdb"
MYSQL_USER="vaibhav"
MYSQL_PASSWORD="1234"
NGINX_CONTAINER="nginx"
NGINX_CONF="nginx.conf"

# Build Quarkus API image
echo "Building Quarkus API image..."
podman build -f src/main/docker/Dockerfile.jvm -t $IMAGE_NAME .

# Create Pod
echo "Creating pod: $POD_NAME..."
podman pod create --name $POD_NAME -p 80:80 -p 8080:8080 -p 8081:8081 -p 8082:8082

# Run MySQL container
echo "Starting MySQL container..."
podman run -d --pod $POD_NAME --name $MYSQL_CONTAINER \
  -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
  -e MYSQL_DATABASE=$MYSQL_DATABASE \
  -e MYSQL_USER=$MYSQL_USER \
  -e MYSQL_PASSWORD=$MYSQL_PASSWORD \
  mysql:latest

# Run Quarkus API instances
for i in {0..2}; do
  PORT=$((8080 + i))
  CONTAINER_NAME="quarkus-api$((i+1))"
  echo "Starting Quarkus API container: $CONTAINER_NAME on port $PORT..."
  podman run -d --pod $POD_NAME --name $CONTAINER_NAME \
    -e QUARKUS_HTTP_PORT=$PORT \
    -e QUARKUS_DATASOURCE_URL="jdbc:mysql://localhost:3306/$MYSQL_DATABASE" \
    -e QUARKUS_DATASOURCE_USERNAME=$MYSQL_USER \
    -e QUARKUS_DATASOURCE_PASSWORD=$MYSQL_PASSWORD \
    $IMAGE_NAME
done

# Run Nginx container
echo "Starting Nginx container..."
podman run -d --pod $POD_NAME --name $NGINX_CONTAINER \
  -v $(pwd)/$NGINX_CONF:/etc/nginx/nginx.conf:ro \
  nginx:latest

echo "Deployment complete!"

