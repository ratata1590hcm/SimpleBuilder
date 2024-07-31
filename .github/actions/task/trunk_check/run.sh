#!/bin/bash
if [[ ! -d ".trunk" ]]; then
	echo "Trunk is not initialized. Initializing..."
	trunk init
	echo "Trunk initialization complete."
else
	echo "Trunk is already initialized."
fi

# Run Trunk check
echo "Running Trunk check..."
trunk check -a
