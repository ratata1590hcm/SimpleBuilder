#!/bin/bash
set -e
cd source_code
docker compose build --progress=plain --pull | grep -v "Pulling" || true
