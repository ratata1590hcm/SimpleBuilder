#!/bin/bash

# Function to handle script exit
cleanup() {
	echo "export logs..."
	docker compose -f "${COMPOSE_FILE}" logs --tail all >build.log
	cat build.log
	echo "Pushing images to registry..."
	docker compose -f "${COMPOSE_FILE}" push >/dev/null 2>&1
	echo "Taking down the environment..."
	docker compose -f "${COMPOSE_FILE}" down -v
}

# Set the trap to call cleanup function on EXIT signal
trap cleanup EXIT

# Start the containers in the background
# default
COMPOSE_FILE=docker-compose.yml
# docker compose -f "${COMPOSE_FILE}" build >/dev/null 2>&1
docker compose -f "${COMPOSE_FILE}" build
docker compose -f "${COMPOSE_FILE}" up -d