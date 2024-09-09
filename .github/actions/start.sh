#!/bin/bash

# Function to handle script exit
cleanup() {
	echo "export logs..."
	# docker compose -f "${COMPOSE_FILE}" logs --tail all >build.log
	rm build.log
	# trunk-ignore(shellcheck/SC2312)
	docker compose -f "${COMPOSE_FILE}" config --services | while read -r service; do
		echo "===== Logs for ${service} =====" >>build.log
		docker compose -f "${COMPOSE_FILE}" logs --tail all "${service}" >>build.log
	done

	cat build.log
	# echo "Pushing images to registry..."
	# docker compose -f "${COMPOSE_FILE}" push >/dev/null 2>&1

	# export volume
	[[ ! -d "./output" ]] && mkdir -p "./output"
	docker volume inspect actions_workspace &>/dev/null && docker run --rm -v actions_workspace:/mnt/volume -v ./output:/mnt/output busybox /bin/sh -c "cp -r /mnt/volume/. /mnt/output/" || echo "Volume does not exist."

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
