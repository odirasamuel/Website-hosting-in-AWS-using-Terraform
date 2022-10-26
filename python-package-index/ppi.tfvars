thumbnail          = "6938fd4d98bab03faadb97b34396831e3780aea1"
stack_name         = "python-package-index"
availability_zones = {
    dev = ["us-east-1a", "us-east-1b", "us-east-1c"]
    staging = ["us-west-1a", "us-west-1b", "us-west-1c"]
    prod = ["us-west-1a", "us-west-1b", "us-west-1c"]
}
cidr_block = {
  dev     = "10.47.0.0/22"
  staging = "10.48.0.0/22"
  prod    = "10.49.0.0/22"
}
public_subnets_count = {
  dev     = 3
  staging = 3
  prod    = 3
}
public_subnets_cidr = {
  dev     = ["10.47.0.128/25", "10.47.1.128/25", "10.47.2.128/25"]
  staging = ["10.48.0.128/25", "10.48.1.128/25", "10.48.2.128/25"]
  prod    = ["10.49.0.128/25", "10.49.1.128/25", "10.49.2.128/25"]
}
private_subnets_count = {
  dev     = 3
  staging = 3
  prod    = 3
}
private_subnets_cidr = {
  dev     = ["10.47.0.0/25", "10.47.1.0/25", "10.47.2.0/25"]
  staging = ["10.48.0.0/25", "10.48.1.0/25", "10.48.2.0/25"]
  prod    = ["10.49.0.0/25", "10.49.1.0/25", "10.49.2.0/25"]
}
nat_gateway_count = {
  dev     = 1
  staging = 1
  prod    = 1
}
elastic_ips = {
  dev     = 1
  staging = 1
  prod    = 1
}
domain_name = {
  dev = {
    domain = "dev.xyx.example.com"
  }
  staging = {
    domain = "staging.xyz.example.com"
  }
  prod = {
    domain = "xyz.example.com"
  }
}



