#!/bin/bash
set -e
# Copy all files including hidden ones
shopt -s dotglob # Enable copying of hidden files
cp -rf /code/* /workspace

# Set permissions
chmod -R 777 /workspace
echo "done"
