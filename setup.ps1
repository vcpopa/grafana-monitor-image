# Function to display error messages and exit
function error_exit {
    param([string]$message)
    Write-Error "Error: $message"
    exit 1
}

# Function to display success message
function success_message {
    Write-Output "Setup completed successfully."
}

# Get the directory where the script is located
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$rootPath = $scriptPath

# Create folder structure
$prometheusPath = Join-Path -Path $rootPath -ChildPath "promgrafnode\prometheus"
$grafanaPath = Join-Path -Path $rootPath -ChildPath "promgrafnode\grafana\provisioning"
$prometheusFile = Join-Path -Path $rootPath -ChildPath "prometheus.yml"

# Check if folders already exist
if (Test-Path -Path $prometheusPath -or Test-Path -Path $grafanaPath) {
    error_exit "Prometheus or Grafana folders already exist. Proceed with caution."
}

# Create folders
New-Item -ItemType Directory -Force -Path $prometheusPath
if (-not $?) {
    error_exit "Failed to create prometheus directory."
}
New-Item -ItemType Directory -Force -Path $grafanaPath
if (-not $?) {
    error_exit "Failed to create grafana directory."
}

# Copy prometheus.yml and .env
Copy-Item -Path $prometheusFile -Destination $prometheusPath -ErrorAction Stop
if (-not $?) {
    error_exit "Failed to copy prometheus.yml."
}

# Display success message
success_message

docker-compose up -d
if (-not $?) {
    error_exit "Failed to run docker-compose."
}

exit 0
