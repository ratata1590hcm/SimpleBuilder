#!/bin/bash
trivy image --severity CRITICAL --exit-code 1 test/test:latest