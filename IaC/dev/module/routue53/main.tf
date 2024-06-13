resource "aws_route53_record" "dev_record" {
  count = var.domain_dev
  

  zone_id = var.hosted_zone_id
  name = var.domain_dev
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}