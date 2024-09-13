#!/bin/bash
# Directory containing the .jmx files
JMX_DIR="/workspace/jmeter"
# Directory where the results will be saved
RESULTS_DIR="/jmeter_result"

# Create the results directory if it doesn't exist
mkdir -p "$RESULTS_DIR"

# Loop through all .jmx files in the specified directory
for jmx_file in "$JMX_DIR"/*.jmx; do
	# Extract the base name of the .jmx file (without extension)
	base_name=$(basename "$jmx_file" .jmx)
	# Define the output results file
	results_file="$RESULTS_DIR/${base_name}_results.jtl"
	# Run JMeter in non-GUI mode with the current .jmx file and save results
	jmeter -n -t "$jmx_file" -l "$results_file"
	# Print a message indicating the test has completed
	echo "Test completed for $jmx_file. Results saved to $results_file."
done
