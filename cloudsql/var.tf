# Variable for the Google Cloud project ID
variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
}

# Variable for the name of the Cloud SQL instance
variable "instance_name" {
  description = "The name of the Cloud SQL instance."
  type        = string
}

# Variable for the database version to use (e.g., POSTGRES_15)
variable "database_version" {
  description = "The version of the database to use for the Cloud SQL instance."
  type        = string
  default     = "POSTGRES_15"
}

# Variable for the region where the Cloud SQL instance will be deployed
variable "region" {
  description = "The region where the Cloud SQL instance will be deployed."
  type        = string
  default     = "us-central1"
}

# Variable for the database tier (e.g., db-f1-micro)
variable "db_tier" {
  description = "The tier (machine type) for the Cloud SQL instance."
  type        = string
  default     = "db-f1-micro"
}

# Variable for the name of the database to create
variable "database_name" {
  description = "The name of the database to create within the Cloud SQL instance."
  type        = string
}

# Variable for the database user
variable "db_user" {
  description = "The username for the Cloud SQL database."
  type        = string
}

# Variable for the database user's password
variable "db_password" {
  description = "The password for the Cloud SQL database user."
  type        = string
  sensitive   = true
}
