#!/bin/bash

# Function to handle script exit
cleanup() {
	echo "export logs..."
	docker-compose logs --tail all >build.log
	cat build.log
    echo "Pushing images to registry..."
    docker-compose push > /dev/null 2>&1
    echo "Taking down the environment..."
    docker-compose down -v > /dev/null 2>&1
}

# Set the trap to call cleanup function on EXIT signal
trap cleanup EXIT

# Start the containers in the background
docker-compose up -d
