variable "aws_reg" {
    type = string
    description = "(optional) describe your variable"
    default = "us-west-1"
}

variable "domain_name" {
  type = string
  default = "drakenor.com"
}

variable "common_tags" {
    type = map(string)
    description = "(optional) describe your variable"
    default = {
        project = "cf-acm"
    }
}

variable "delegation_set" {
    type = string
    description = "(optional) describe your variable"
    default = "N2C91XI7GNCS9E"
}

#https://docs.aws.amazon.com/general/latest/gr/s3.html#s3_website_region_endpoints
variable "s3_hosted_zone_id" {
    type = string
    description = "(optional) describe your variable"
    default = "Z2F56UZL2M1ACD"
}