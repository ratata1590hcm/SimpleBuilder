#!/bin/bash
rm -rf ${RESULT_PATH}
while [[ ! -f "${RESULT_PATH}" || ! -s "${RESULT_PATH}" ]]; do 
    sleep 1
done