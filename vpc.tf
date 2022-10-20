resource "aws_vpc" "main" {
  cidr_block           = var.VPC_CIDR
  enable_dns_hostnames = true    # make to true, to enable DNS Translations in the VPC
  enable_dns_support   = true

  tags = {
    Name = "${var.ENV}-vpc"
  }
}