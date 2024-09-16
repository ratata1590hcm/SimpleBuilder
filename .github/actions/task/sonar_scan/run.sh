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
	echo ${SONAR_HOST_URL}
	sonar-scanner \
		-Dsonar.projectKey="${SONAR_PROJECT_KEY}" \
		-Dsonar.sources="/workspace/${SOURCE_CODE_DIR}" \
		-Dsonar.host.url="${SONAR_HOST_URL}" \
		-Dsonar.login="${SONAR_TOKEN}"
	# sonar-scanner \
	# 	-Dsonar.projectKey=test \
	# 	-Dsonar.sources=/workspace/source_code \
	# 	-Dsonar.host.url=http://192.168.0.1:9001 \
	# 	-Dsonar.login=sqp_a2069a5b96c474a727eb845d695b6991f7d15864
}

if [[ ! -f ${env_file} ]]; then
	if [[ -z ${SONAR_HOST_URL} ]] || [[ -z ${SONAR_PROJECT_KEY} ]] || [[ -z ${SONAR_TOKEN} ]] || [[ -z ${SOURCE_CODE_DIR} ]]; then
		echo "ERROR: SONAR_HOST_URL and SONAR_PROJECT_KEY and SONAR_TOKEN and SOURCE_CODE_DIR must be set."
	else
		scan
	fi
else
	scan
fi
