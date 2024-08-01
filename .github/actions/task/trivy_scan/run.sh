#!/bin/bash

# Define the path to your docker-compose.yml file
COMPOSE_FILE="docker-compose.yml"

# Load environment variables from a .env file if it exists
if [[ -f .env ]]; then
	export "$(grep -v '^#' .env | xargs)"
fi

# Check for necessary environment variables and set defaults if not provided
REGISTRY_HOST=${REGISTRY_HOST:-"localhost"}
REGISTRY_NAMESPACE=${REGISTRY_NAMESPACE:-"namespace"}

# Check if the file exists
if [[ ! -f ${COMPOSE_FILE} ]]; then
	echo "File ${COMPOSE_FILE} does not exist."
	exit 1
fi

# Extract and list all Docker images from docker-compose.yml
# trunk-ignore(shellcheck/SC2312)
images=$(grep -E 'image:' "${COMPOSE_FILE}" | awk '{print $2}')

# Loop through each image and scan with Trivy for critical vulnerabilities
for image in ${images}; do
	# Replace placeholders with actual environment variables if present
	# trunk-ignore(shellcheck/SC2312)
	image=$(echo "${image}" | sed "s|\${REGISTRY_HOST}|${REGISTRY_HOST}|g" | sed "s|\${REGISTRY_NAMESPACE}|${REGISTRY_NAMESPACE}|g")

	echo "Scanning ${image} for critical vulnerabilities..."

	# Perform the scan with Trivy and output in JSON format
	output=$(trivy image --severity CRITICAL --exit-code 1 --format json "${image}" 2>&1)

	# Handle Trivy errors
	# trunk-ignore(shellcheck/SC2181)
	if [[ $? -ne 0 ]]; then
		echo "Error scanning image ${image}: ${output}"
		continue
	fi

	# Save the output to a JSON file named after the image (replacing : with _)
	echo "${output}" | jq '.' >"${image//[:\/]/_}_critical_vulnerabilities.json"

	# Extract critical vulnerabilities
	critical_vulnerabilities=$(echo "${output}" | jq -r '.Results[].Vulnerabilities[] | select(.Severity == "CRITICAL") | .VulnerabilityID')

	if [[ -z ${critical_vulnerabilities} ]]; then
		echo "No critical vulnerabilities found for ${image}."
	else
		echo "Critical vulnerabilities found for ${image}:"
		echo "${critical_vulnerabilities}"
	fi
done
