# Variable for the name of the Google Cloud Storage bucket
variable "bucket_name" {
  description = "The name of the Google Cloud Storage bucket."
  type        = string
}

# Variable for the location of the bucket
# Default is 'us-central1'
variable "bucket_location" {
  description = "The location where the Google Cloud Storage bucket will be created."
  type        = string
  default     = "us-central1"
}

# Variable for the storage class of the bucket
# Default is 'STANDARD'
variable "storage_class" {
  description = "The storage class of the Google Cloud Storage bucket."
  type        = string
  default     = "STANDARD"
}

# Variable for the name of the object to be uploaded to the bucket
variable "object_name" {
  description = "The name of the object to be uploaded to the Google Cloud Storage bucket."
  type        = string
}

# Variable for the local path to the source file to be uploaded
variable "source_file_path" {
  description = "The local file path of the object to be uploaded to the Google Cloud Storage bucket."
  type        = string
}
