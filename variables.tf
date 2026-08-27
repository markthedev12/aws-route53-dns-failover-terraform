variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Domain name for Route 53 zone"
  type        = string
  default     = "schwinngroup.com"
}