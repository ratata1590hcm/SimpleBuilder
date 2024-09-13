#!/bin/sh
set -e
# export JAVA_OPTS="${JAVA_OPTS} -Dhttp.proxyHost=172.18.0.1 -Dhttp.proxyPort=3128 -Dhttps.proxyHost=172.18.0.1 -Dhttps.proxyPort=3128"
if [ -n "${http_proxy}" ]; then
	http_proxy_host=$(echo "${http_proxy}" | awk -F[/:] '{print $4}')
	http_proxy_port=$(echo "${http_proxy}" | awk -F[/:] '{print $5}')
	https_proxy_host=$(echo "${https_proxy}" | awk -F[/:] '{print $4}')
	https_proxy_port=$(echo "${https_proxy}" | awk -F[/:] '{print $5}')
	export JAVA_OPTS="${JAVA_OPTS} -Dhttp.proxyHost=${http_proxy_host} -Dhttp.proxyPort=${http_proxy_port} -Dhttps.proxyHost=${https_proxy_host} -Dhttps.proxyPort=${https_proxy_port}"
	# echo "JAVA_OPTS=\"${JAVA_OPTS}\"" >> ~/.profile
fi

/usr/share/dependency-check/bin/dependency-check.sh --nvdApiKey "${NVD_APIKEY}" --scan source_code --format "ALL" --project "dependency-check scan" --out ./report
node /action/check_report.js ./report/dependency-check-report.json
echo "dependency check passed!"
