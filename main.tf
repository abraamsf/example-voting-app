# --- CONFIGURATION BLOCK ---
# We define which provider we want to use.
# Since we are running locally, we use the "Docker" provider 
# to simulate infrastructure provisioning without AWS/Cloud costs.
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# Initialize the Docker provider
provider "docker" {}

# --- RESOURCE 1: DOCKER IMAGE ---
# This resource instructs Terraform to pull the Nginx image.
# Equivalent to running: `docker pull nginx:latest`
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false # Delete image from local storage if we destroy the resource
}

# --- RESOURCE 2: DOCKER CONTAINER ---
# This resource creates and runs the actual container instance.
# Equivalent to running: `docker run -d -p 8080:80 --name iac-web-server nginx`
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "iac-web-server"
  
  # Configure port mapping: Host Port 8080 -> Container Port 80
  ports {
    internal = 80
    external = 8080
  }
}