# Reserve a global static IP address for the load balancer
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address
resource "google_compute_global_address" "default" {
  name = var.global_address_name
}

# Create a regional backend service for the load balancer
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_backend_service
resource "google_compute_region_backend_service" "default" {
  name     = var.backend_service_name
  region   = var.region
  protocol = "HTTP"

  backend {
    group = google_cloud_run_service.main.name
  }

  # Attach a health check to the backend service
  health_checks = [google_compute_health_check.default.id]
}

# Define a health check for the backend service
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_health_check
resource "google_compute_health_check" "default" {
  name = var.health_check_name

  http_health_check {
    request_path = "/"
    port         = var.health_check_port
  }
}

# Create a URL map to route incoming requests to the backend service
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_url_map
resource "google_compute_region_url_map" "default" {
  name            = var.url_map_name
  region          = var.region
  default_service = google_compute_region_backend_service.default.id
}

# Create a target HTTP proxy to route requests to the URL map
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_target_http_proxy
resource "google_compute_region_target_http_proxy" "default" {
  name    = var.http_proxy_name
  region  = var.region
  url_map = google_compute_region_url_map.default.id
}

# Create a global forwarding rule to route traffic to the HTTP proxy
# Documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule
resource "google_compute_global_forwarding_rule" "default" {
  name       = var.forwarding_rule_name
  target     = google_compute_region_target_http_proxy.default.id
  port_range = "80"
  ip_address = google_compute_global_address.default.address
}
