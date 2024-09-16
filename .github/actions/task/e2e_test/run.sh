#!/bin/bash
# sleep 86400
cd /workspace/cypress
npm install
npx cypress run --project /workspace/cypress --browser chrome
