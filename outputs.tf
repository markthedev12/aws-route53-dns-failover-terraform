output "name_servers" {
  description = "Name servers assigned to the hosted zone"
  value       = aws_route53_zone.primary.name_servers
}

output "health_check_id" {
  description = "ID of the Route 53 health check"
  value       = aws_route53_health_check.primary_check.id
}