output "website_domain_name" {
  description = "The domain of website"
  value       = aws_route53_record.record.*.name
}