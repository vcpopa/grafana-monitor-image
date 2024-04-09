#!/bin/bash

# Function to display error messages and exit
error_exit() {
    echo "Error: $1" >&2
    exit 1
}

# Function to display success message
success_message() {
    echo "Setup completed successfully."
}

# Get the directory where the script is located
scriptPath=$(dirname "$(readlink -f "$0")")
rootPath=$scriptPath

# Create folder structure
prometheusPath="$rootPath/promgrafnode/prometheus"
grafanaPath="$rootPath/promgrafnode/grafana/provisioning"
prometheusFile="$rootPath/prometheus.yml"

# Check if folders already exist
if [ -d "$prometheusPath" ] || [ -d "$grafanaPath" ]; then
    error_exit "Prometheus or Grafana folders already exist. Proceed with caution."
fi

# Create folders
mkdir -p "$prometheusPath" || error_exit "Failed to create prometheus directory."
mkdir -p "$grafanaPath" || error_exit "Failed to create grafana directory."

# Copy prometheus.yml
cp "$prometheusFile" "$prometheusPath" || error_exit "Failed to copy prometheus.yml."

# Display success message
success_message

exit 0
