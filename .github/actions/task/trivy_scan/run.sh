#!/bin/bash

# Define the path to your docker-compose.yml file
COMPOSE_FILE="docker-compose.yml"

# Check if the file exists
if [ ! -f "$COMPOSE_FILE" ]; then
  echo "File $COMPOSE_FILE does not exist."
  exit 1
fi

# Extract and list all Docker images from docker-compose.yml
images=$(grep -E 'image:' "$COMPOSE_FILE" | awk '{print $2}')

# Loop through each image and scan with Trivy for critical vulnerabilities
for image in ${images}; do
  echo "Scanning ${image} for critical vulnerabilities..."
  # Perform the scan with Trivy and output in JSON format
  output=$(trivy image --severity CRITICAL --exit-code 1 --format json "${image}")
  
  # Save the output to a JSON file named after the image (replacing : with _)
  echo "${output}" | jq '.' > "${image//:/_}_critical_vulnerabilities.json"
  
  # Extract critical vulnerabilities
  critical_vulnerabilities=$(echo "${output}" | jq -r '.Results[].Vulnerabilities[] | select(.Severity == "CRITICAL") | .VulnerabilityID')
  
  if [[ -z ${critical_vulnerabilities} ]]; then
    echo "No critical vulnerabilities found for ${image}."
  else
    echo "Critical vulnerabilities found for ${image}:"
    echo "${critical_vulnerabilities}"
  fi
done
