#!/bin/sh
set -e
/usr/share/dependency-check/bin/dependency-check.sh --scan . --format "ALL" --project "dependency-check scan" --out ./report
