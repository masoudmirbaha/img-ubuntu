#!/bin/bash

# Backup storage path
BACKUP_DIR="/home/docker_backups"
mkdir -p "$BACKUP_DIR"

# Get the list of running containers with their names
RUNNING_CONTAINERS=$(docker ps --format "{{.Names}}")

# Check if any container is running
if [ -z "$RUNNING_CONTAINERS" ]; then
    echo " No running containers found."
    exit 1
fi

# Process each running container by name
for CONTAINER_NAME in $RUNNING_CONTAINERS; do
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    IMAGE_NAME="backup_${CONTAINER_NAME}_${TIMESTAMP}"

    echo " Creating an image from container: $CONTAINER_NAME ..."
    docker commit "$CONTAINER_NAME" "$IMAGE_NAME"

    echo " Saving the image as a .tar file ..."
    docker save -o "$BACKUP_DIR/${IMAGE_NAME}.tar" "$IMAGE_NAME"

    echo " Compressing the .tar file with xz ..."
    xz -z "$BACKUP_DIR/${IMAGE_NAME}.tar"

    echo " Compressed file saved: $BACKUP_DIR/${IMAGE_NAME}.tar.xz"
done

echo " Backup and compression process completed."

