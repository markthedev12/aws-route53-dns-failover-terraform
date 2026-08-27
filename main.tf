terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# 1. Public Hosted Zone
resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

# 2. Public Endpoint Health Check
resource "aws_route53_health_check" "primary_check" {
  fqdn              = "app.${var.domain_name}"
  port              = 80
  type              = "HTTP"
  resource_path     = "/health"
  failure_threshold = 3
  request_interval  = 30

  tags = {
    Name = "primary-app-healthcheck"
  }
}

# 3. Failover Primary Record
resource "aws_route53_record" "primary_app" {
  zone_id        = aws_route53_zone.primary.zone_id
  name           = "app.${var.domain_name}"
  type           = "A"
  ttl            = 60
  set_identifier = "primary-prod"

  failover_routing_policy {
    type = "PRIMARY"
  }

  health_check_id = aws_route53_health_check.primary_check.id
  records         = ["198.51.100.10"]
}

# 4. Failover Secondary / Disaster Recovery Record
resource "aws_route53_record" "secondary_app" {
  zone_id        = aws_route53_zone.primary.zone_id
  name           = "app.${var.domain_name}"
  type           = "A"
  ttl            = 60
  set_identifier = "secondary-dr"

  failover_routing_policy {
    type = "SECONDARY"
  }

  records = ["198.51.100.99"]
}