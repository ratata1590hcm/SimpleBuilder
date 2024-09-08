#!/bin/sh
set -e
/usr/share/dependency-check/bin/dependency-check.sh --scan . --format "ALL" --project "dependency-check scan" --out ./report
node /action/check.js ./report/dependency-check-report.json
echo "dependency check passed!"
