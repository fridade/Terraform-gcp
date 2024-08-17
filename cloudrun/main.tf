# Resource to define a Cloud Run service
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service
resource "google_cloud_run_service" "default" {
  # Name of the Cloud Run service
  name     = var.service_name

  # Region where the service will be deployed
  # Refer to GCP supported regions: https://cloud.google.com/run/docs/locations
  location = var.region

  template {
    spec {
      containers {
        # Container image to deploy
        # Must be stored in a container registry accessible to Cloud Run
        image = var.container_image

        # Environment variable for the port
        # Cloud Run uses this port to route requests to the container
        # Documentation: https://cloud.google.com/run/docs/container-contract#port
        env {
          name  = "PORT"
          value = var.port
        }
      }
    }
  }

  # Traffic management configuration
  traffic {
    # Route 100% of traffic to the latest revision
    # Documentation: https://cloud.google.com/run/docs/traffic-migration
    percent         = 100
    latest_revision = true
  }
}

# Resource to set IAM permissions for the Cloud Run service
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_member
resource "google_cloud_run_service_iam_member" "default" {
  # Link to the Cloud Run service resource
  service  = google_cloud_run_service.default.name

  # Region where the service is deployed
  location = google_cloud_run_service.default.location

  # Assign the 'roles/run.invoker' role to make the service publicly accessible
  # Documentation: https://cloud.google.com/run/docs/securing/authenticating#allowing_unauthenticated
  role     = "roles/run.invoker"

  # Set to 'allUsers' to allow public access to the service
  member   = "allUsers"
}
# Resource to define a Cloud Run service
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service
resource "google_cloud_run_service" "default" {
  # Name of the Cloud Run service
  name     = var.service_name

  # Region where the service will be deployed
  # Refer to GCP supported regions: https://cloud.google.com/run/docs/locations
  location = var.region

  template {
    spec {
      containers {
        # Container image to deploy
        # Must be stored in a container registry accessible to Cloud Run
        image = var.container_image

        # Environment variable for the port
        # Cloud Run uses this port to route requests to the container
        # Documentation: https://cloud.google.com/run/docs/container-contract#port
        env {
          name  = "PORT"
          value = var.port
        }
      }
    }
  }

  # Traffic management configuration
  traffic {
    # Route 100% of traffic to the latest revision
    # Documentation: https://cloud.google.com/run/docs/traffic-migration
    percent         = 100
    latest_revision = true
  }
}

# Resource to set IAM permissions for the Cloud Run service
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_member
resource "google_cloud_run_service_iam_member" "default" {
  # Link to the Cloud Run service resource
  service  = google_cloud_run_service.default.name

  # Region where the service is deployed
  location = google_cloud_run_service.default.location

  # Assign the 'roles/run.invoker' role to make the service publicly accessible
  # Documentation: https://cloud.google.com/run/docs/securing/authenticating#allowing_unauthenticated
  role     = "roles/run.invoker"

  # Set to 'allUsers' to allow public access to the service
  member   = "allUsers"
}


