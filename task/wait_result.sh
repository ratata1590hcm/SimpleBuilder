#!/bin/bash
RESULT_PATH=/workspace/result
rm -rf ${RESULT_PATH}
while [[ ! -f "${RESULT_PATH}" || ! -s "${RESULT_PATH}" ]]; do 
    sleep 1
done