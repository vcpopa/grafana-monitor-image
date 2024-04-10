# Monitoring Setup using Grafana, Prometheus, and Docker

This repository provides a comprehensive setup for monitoring using Grafana, Prometheus, and Docker. It allows users to efficiently monitor various metrics and services in their environment.

## Installation Instructions

Follow these steps to set up the monitoring environment on both Windows and Linux:

### Prerequisites

- Docker
- Docker Compose
- Powershell (on Windows)

Clone this repository to your local machine:

git clone <https://github.com/vcpopa/grafana-monitor-image.git>

## Environment Configuration

Create an .env file in the root directory of the repository and populate it with the following environment variables:

SQL_SERVER=Your_SQL_SERVER_IP
SQL_USERNAME=Your_SQL_USERNAME
SQL_PASSWORD=Your_SQL_PASSWORD
SQL_PORT=Your_SQL_PORT (Optional)

Adjust the values of these variables according to your SQL server configuration.

## Running the Setup Script

### Windows

Open PowerShell as Administrator.
Navigate to the root directory of the cloned repository.
Execute the setup script: **.\setup.ps1**

### Linux

Open a terminal.
Navigate to the root directory of the cloned repository.
Execute the setup script: **./setup.sh**

This script performs the following actions:

Creates necessary folder structure for Prometheus and Grafana configurations.
Copies prometheus.yml and .env file to the appropriate locations.
Spins up Docker containers using docker-compose.

## Configuration Details

Prometheus Configuration:
The Prometheus configuration file (**prometheus.yml**) specifies various jobs for scraping metrics from targets.
Adjust the targets section in prometheus.yml to add or modify targets as per your requirements.

Grafana Configuration:
Grafana is configured to provision data sources and dashboards automatically.
Place your data source configuration files in promgrafnode/grafana/provisioning/datasources.
Dashboards can be added by placing JSON files in promgrafnode/grafana/provisioning/dashboards.

Accessing Services

Prometheus UI: <http://localhost:9090>
Grafana UI: <http://localhost:3000>
Default credentials: admin/admin
