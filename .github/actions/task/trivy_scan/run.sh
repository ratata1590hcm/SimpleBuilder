#!/bin/bash

# Get a list of all Docker images
images=$(docker images --format "{{.Repository}}:{{.Tag}}")

# Loop through each image and scan with Trivy for critical vulnerabilities
for image in ${images}; do
	echo "Scanning ${image} for critical vulnerabilities..."
	output=$(trivy image --severity CRITICAL --exit-code 1 --format json "${image}")
	echo "${output}" | jq '.' >"${image//:/_}_critical_vulnerabilities.json"

	critical_vulnerabilities=$(echo "${output}" | jq -r '.Results[].Vulnerabilities[] | select(.Severity == "CRITICAL") | .VulnerabilityID')

	if [[ -z ${critical_vulnerabilities} ]]; then
		echo "No critical vulnerabilities found for ${image}."
	else
		echo "Critical vulnerabilities found for ${image}:"
		echo "${critical_vulnerabilities}"
	fi
done
