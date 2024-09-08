#!/bin/bash
env_file=".env.sonar"

# Load environment variables from a .env file if it exists
if [[ -f ".env.sonar" ]]; then
	source .env.sonar
else
	echo "skip sonar scan .env.sonar not exist"
	exit
fi

scan() {
	echo "start scan"
	# trunk-ignore(shellcheck/SC2269)
	SONAR_HOST_URL="${SONAR_HOST_URL}"
	# trunk-ignore(shellcheck/SC2034)
	SONAR_SCANNER_OPTS="-Dsonar.projectKey=${SONAR_PROJECT_KEY}"
	# trunk-ignore(shellcheck/SC2269)
	SONAR_TOKEN="${SONAR_TOKEN}"
	sonar-scanner
}

if [[ ! -f ${env_file} ]]; then
	if [[ -z ${SONAR_HOST_URL} ]] || [[ -z ${SONAR_PROJECT_KEY} ]] || [[ -z ${SONAR_TOKEN} ]]; then
		echo "ERROR: SONAR_HOST_URL and SONAR_PROJECT_KEY and SONAR_TOKEN must be set."
	else
		scan
	fi
else
	scan
fi
