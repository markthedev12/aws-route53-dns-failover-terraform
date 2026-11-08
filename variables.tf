variable "aws_region" {
  description = "AWS provider region"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Domain you control; the new hosted zone must be delegated separately"
  type        = string
}

variable "primary_ipv4" {
  description = "Public IPv4 primary endpoint serving /health on HTTP/80"
  type        = string
  validation {
    condition     = can(cidrnetmask("${var.primary_ipv4}/32"))
    error_message = "primary_ipv4 must be an IPv4 address."
  }
}

variable "secondary_ipv4" {
  description = "Public IPv4 standby endpoint; must serve the application independently"
  type        = string
  validation {
    condition     = can(cidrnetmask("${var.secondary_ipv4}/32"))
    error_message = "secondary_ipv4 must be an IPv4 address."
  }
}
