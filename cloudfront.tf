# resource "aws_cloudfront_distribution" "s3_dist" {
#   origin {
#     domain_name = "drakenor.com.s3-website-us-west-1.amazonaws.com"
#     origin_id = "S3-www.drakenor.com"

#     custom_origin_config {
#       http_port              = 80
#       https_port             = 443
#       origin_protocol_policy = "http-only"
#       origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
#     }
#   }
# }