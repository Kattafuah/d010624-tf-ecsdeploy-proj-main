resource "aws_route53_record" "www-live" {
  zone_id = var.zone_id
  name    = var.dns_record_name
  type    = "CNAME"
  ttl     = 300
  records = [aws_lb.main.dns_name]
}
