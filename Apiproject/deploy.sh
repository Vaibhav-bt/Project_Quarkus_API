#!/bin/bash

# Set network name and image name
NETWORK="mynetwork"
IMAGE="crud-api:latest"

# Build Quarkus image
podman build -t $IMAGE .

# Create network (if not exists)
podman network create $NETWORK || true

# Run MySQL container
podman run -d \
    --name mydb \
    --network $NETWORK \
    -e MYSQL_ROOT_PASSWORD=1234 \
    -e MYSQL_DATABASE=testdb \
    -e MYSQL_USER=vaibhav \
    -e MYSQL_PASSWORD=1234 \
    -v mydb_data:/var/lib/mysql \
    docker.io/mysql:latest


# Run 3 API containers
podman run -d --name api1 --network $NETWORK -p 8081:8081 -e QUARKUS_HTTP_PORT=8081 -e QUARKUS_DATASOURCE_JDBC_URL=jdbc:mysql://mydb:3306/testdb $IMAGE
podman run -d --name api2 --network $NETWORK -p 8082:8082 -e QUARKUS_HTTP_PORT=8082 -e QUARKUS_DATASOURCE_JDBC_URL=jdbc:mysql://mydb:3306/testdb $IMAGE
podman run -d --name api3 --network $NETWORK -p 8083:8083 -e QUARKUS_HTTP_PORT=8083 -e QUARKUS_DATASOURCE_JDBC_URL=jdbc:mysql://mydb:3306/testdb $IMAGE

# Run Nginx container
podman run -d \
    --name nginx \
    --network $NETWORK \
    -p 8088:80 \
    -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
    docker.io/nginx:latest


echo "All containers are running!"
