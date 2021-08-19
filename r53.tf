resource "aws_route53_zone" "main" {
  name = var.domain_name
  delegation_set_id = "${var.delegation_set}"
  tags = var.common_tags
}

resource "aws_route53_record" "root-a" {
  zone_id = aws_route53_zone.main.zone_id
  name = var.domain_name
  type = "A"

  alias {
    name = "s3-website-us-west-1.amazonaws.com"
    zone_id = var.s3_hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cv" {
  zone_id = aws_route53_zone.main.zone_id
  name = "cv.${var.domain_name}"
  type = "A"

  alias {
    name = "s3-website-us-west-1.amazonaws.com"
    zone_id = var.s3_hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "blog" {
  zone_id = aws_route53_zone.main.zone_id
  name = "blog.${var.domain_name}"
  type = "A"

  alias {
    name = "s3-website-us-west-1.amazonaws.com"
    zone_id = var.s3_hosted_zone_id
    evaluate_target_health = false
  }
}


resource "aws_route53_record" "cert_validation" {
 for_each = {
   for dvo in aws_acm_certificate.ssl_certificate.domain_validation_options : dvo.domain_name => {
     name    = dvo.resource_record_name
     record  = dvo.resource_record_value
     type    = dvo.resource_record_type
     zone_id = aws_route53_zone.main.zone_id
   }
 }

 allow_overwrite = true
 name            = each.value.name
 records         = [each.value.record]
 ttl             = 60
 type            = each.value.type
 zone_id         = each.value.zone_id
}