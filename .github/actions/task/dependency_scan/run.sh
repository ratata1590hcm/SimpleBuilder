#!/bin/sh
set -e
/usr/share/dependency-check/bin/dependency-check.sh --scan source_code --format "ALL" --project "dependency-check scan" --out ./report
node /action/check_report.js ./report/dependency-check-report.json
echo "dependency check passed!"
