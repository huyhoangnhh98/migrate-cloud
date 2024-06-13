variable "domain_dev" {
  description = "The domain for dev."
  type = string
}

variable "hosted_zone_id" {
  description = "The ID of hosted zone."
  type = string
}

variable "alb_dns_name" {
  description = "The DNS name of ALB."
  type = string
}

variable "alb_zone_id" {
  description = "The ID zone of ALB."
  type = string
}