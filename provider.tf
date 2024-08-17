provider "google" {
  credentials = file("thinking-anthem-424503-b9-f7184e9751fe.json")
  project     = "thinking-anthem-424503-b9"
  region      = "us-central1"
  zone = "us-central1-a"
}

