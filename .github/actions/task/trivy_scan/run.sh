#!/bin/bash

# # Define the path to your docker-compose.yml file
# COMPOSE_FILE="docker-compose.yml"

# # Load environment variables from a .env file if it exists
# if [[ -f .env ]]; then
# 	source .env
# fi

# # Check for necessary environment variables and set defaults if not provided
# REGISTRY_HOST=${REGISTRY_HOST:-"localhost:5000/"}
# REGISTRY_NAMESPACE=${REGISTRY_NAMESPACE:-"library"}

# # Check if the file exists
# if [[ ! -f ${COMPOSE_FILE} ]]; then
# 	echo "File ${COMPOSE_FILE} does not exist."
# 	exit 1
# fi

# # Extract and list all Docker images from docker-compose.yml
# # trunk-ignore(shellcheck/SC2312)
# images=$(grep -E 'image:' "${COMPOSE_FILE}" | awk '{print $2}')

# # Loop through each image and scan with Trivy for critical vulnerabilities
# for image in ${images}; do
# 	# Replace placeholders with actual environment variables if present
# 	# trunk-ignore(shellcheck/SC2001)
# 	image=$(echo "${image}" | sed "s|\${REGISTRY_HOST}\${REGISTRY_NAMESPACE}|${REGISTRY_HOST}${REGISTRY_NAMESPACE}|g")

# 	# Check if image is empty or invalid
# 	if [[ -z ${image} ]]; then
# 		echo "Invalid image name extracted. Skipping..."
# 		continue
# 	fi

# 	echo "Scanning ${image} for critical vulnerabilities..."

# 	# Perform the scan with Trivy and output in JSON format
# 	output=$(trivy -q image --ignore-unfixed --severity CRITICAL --scanners vuln --exit-code 1 --format json "${image}")
# 	found=$?

# 	# Handle Trivy errors
# 	json_file="${image//[:\/]/_}_critical.json"
# 	if [[ ${found} -ne 0 ]]; then
# 		echo "${output}" | jq '.' 2>/dev/null >"${json_file}"
# 		echo "Critical vulnerabilities found for ${image}, check ${json_file}"
# 		continue
# 	else
# 		echo "No critical vulnerabilities found for ${image}."
# 		rm -rf "${json_file}"
# 	fi

# done
# # Define the directory to search. You can change this to your desired directory.
# SEARCH_DIR="."

# # Check for any _critical.json files
# if ls "${SEARCH_DIR}"/*_critical.json 1>/dev/null 2>&1; then
# 	echo "Critical JSON file(s) found. Exiting with status code 1."
# 	exit 1
# else
# 	echo "No critical JSON files found."
# fi
