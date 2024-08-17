# Enable the Cloud Resource Manager API for the specified project
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
resource "google_project_service" "cloud_resource_manager" {
  service = "cloudresourcemanager.googleapis.com"
  project = var.project_id
}

# Enable the Cloud SQL Admin API, dependent on the Cloud Resource Manager API
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
resource "google_project_service" "cloud_sql_admin" {
  service = "sqladmin.googleapis.com"
  project = var.project_id

  # Ensure the Cloud Resource Manager API is enabled first
  depends_on = [google_project_service.cloud_resource_manager]
}

# Create the Cloud SQL instance, dependent on the Cloud SQL Admin API
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_sql_database_instance
resource "google_sql_database_instance" "main" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region

  # Ensure the Cloud SQL Admin API is enabled first
  depends_on = [google_project_service.cloud_sql_admin]

  settings {
    tier = var.db_tier
  }
}

# Create a database within the Cloud SQL instance
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_sql_database
resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.main.name
}

# Create a user for the Cloud SQL database with specified authentication details
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_sql_user
resource "google_sql_user" "default" {
  name     = var.db_user
  instance = google_sql_database_instance.main.name
  password = var.db_password
}
