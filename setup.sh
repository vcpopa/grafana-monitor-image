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

# Create folders
mkdir -p "$prometheusPath"
if [ $? -ne 0 ]; then
    error_exit "Failed to create folder structure."
fi

mkdir -p "$grafanaPath"
if [ $? -ne 0 ]; then
    error_exit "Failed to create folder structure."
fi

# Copy prometheus.yml
cp "$prometheusFile" "$prometheusPath"
if [ $? -ne 0 ]; then
    error_exit "Failed to copy prometheus.yml."
fi

# Display success message
success_message

exit 0
