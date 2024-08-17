# Variable for the name of the Cloud Run service
variable "service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

# Variable for the region where the Cloud Run service will be deployed
# Default is set to 'us-central1'
variable "region" {
  description = "The Google Cloud region where the Cloud Run service will be deployed."
  type        = string
  default     = "us-central1"
}

# Variable for the container image to deploy
# Ensure the image is accessible by Cloud Run (e.g., hosted on GCR or Artifact Registry)
variable "container_image" {
  description = "The container image to deploy."
  type        = string
}

# Variable for the port on which the container listens
# Cloud Run forwards requests to this port
variable "port" {
  description = "The port on which the container listens."
  type        = string
  default     = "8080"
}
