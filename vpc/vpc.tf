data "aws_availability_zones" "current" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.vpc_cidr_block
  enable_ipv6 = false

  azs = var.azs

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  create_database_subnet_group    = false
  create_elasticache_subnet_group = false

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false


  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/" = "shared"
    "responsavel" = var.responsavel
  }

  public_subnet_tags = {
    Tier = "public"

    "kubernetes.io/cluster/mip-dev-cluster" = "shared"
    "kubernetes.io/role/elb"                = "1"
    "responsavel" = var.responsavel
  }

  private_subnet_tags = {
    Tier = "private"

    "kubernetes.io/cluster/mip-dev-cluster" = "shared"
    "kubernetes.io/role/internal-elb"       = "1"
    "responsavel" = var.responsavel
  }
}
