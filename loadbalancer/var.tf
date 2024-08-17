# Variable for the name of the global IP address
variable "global_address_name" {
  description = "The name of the global IP address for the load balancer."
  type        = string
}

# Variable for the name of the backend service
variable "backend_service_name" {
  description = "The name of the backend service for the load balancer."
  type        = string
}

# Variable for the region where the load balancer resources will be deployed
variable "region" {
  description = "The region where the load balancer resources will be deployed."
  type        = string
  default     = "us-central1"
}

# Variable for the name of the health check
variable "health_check_name" {
  description = "The name of the health check for the backend service."
  type        = string
}

# Variable for the port used in the health check
variable "health_check_port" {
  description = "The port number used in the health check."
  type        = string
  default     = "80"
}

# Variable for the name of the URL map
variable "url_map_name" {
  description = "The name of the URL map for the load balancer."
  type        = string
}

# Variable for the name of the HTTP proxy
variable "http_proxy_name" {
  description = "The name of the HTTP proxy for the load balancer."
  type        = string
}

# Variable for the name of the forwarding rule
variable "forwarding_rule_name" {
  description = "The name of the global forwarding rule for the load balancer."
  type        = string
}
