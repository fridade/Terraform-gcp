# Create a Google Cloud Storage bucket
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "GCS1" {
  name          = var.bucket_name
  location      = var.bucket_location
  storage_class = var.storage_class

  # Enable uniform bucket-level access
  # Documentation: https://cloud.google.com/storage/docs/uniform-bucket-level-access
  uniform_bucket_level_access = true
}

# Upload an object to the Google Cloud Storage bucket
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object
resource "google_storage_bucket_object" "photo" {
  name   = var.object_name
  bucket = google_storage_bucket.GCS1.name
  source = var.source_file_path
}
