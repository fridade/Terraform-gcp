terraform {
  backend "gcs" {
    # Name of the Google Cloud Storage (GCS) bucket used to store the Terraform state file.
   
    bucket = "bucket-from-terraform-fridade"  

    # Path within the GCS bucket to store the state file.
    prefix = "terraformgcp/terraform.tfstate"      

  }
}

# Firestore configuration for state locking
# Documentation: https://cloud.google.com/firestore/docs
resource "google_firestore_index" "terraform_lock" {
  collection = "terraform-lock"
  fields = [
    {
      field_path = "lock_id"
      mode       = "ASCENDING"
    }
  ]
}