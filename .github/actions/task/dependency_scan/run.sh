#!/bin/sh
set -e
export JAVA_OPTS="${JAVA_OPTS} -Dhttp.proxyHost=172.18.0.1 -Dhttp.proxyPort=3128 -Dhttps.proxyHost=172.18.0.1 -Dhttps.proxyPort=3128"
/usr/share/dependency-check/bin/dependency-check.sh --nvdApiKey "${NVD_APIKEY}" --scan source_code --format "ALL" --project "dependency-check scan" --out ./report
node /action/check_report.js ./report/dependency-check-report.json
echo "dependency check passed!"
