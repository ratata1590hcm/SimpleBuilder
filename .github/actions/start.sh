#!/bin/bash

# Function to handle script exit
cleanup() {
	echo "export logs..."
	docker-compose logs --tail all >build.log
	cat build.log
	echo "Pushing images to registry..."
	docker-compose push
	echo "Taking down the environment..."
	docker-compose down -v
}

# Set the trap to call cleanup function on EXIT signal
trap cleanup EXIT

# Start the containers in the background
docker-compose up -d
