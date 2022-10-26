provider "aws" {
  alias   = "dev"
  region  = "us-east-1"
  profile = "odira"

  default_tags {
    tags = {
      "Environment" = terraform.workspace
    }
  }
}

provider "aws" {
  alias   = "prod"
  region  = "us-west-1"
  profile = "odira"

  default_tags {
    tags = {
      "Environment" = terraform.workspace
    }
  }
}

provider "aws" {
  profile = "robotics_robot_stack_dev-admin"
  alias   = "robotics_robot_stack_dev"

  region = "us-east-1"

  default_tags {
    tags = {
      ou = "robotics"
    }
  }
}


provider "aws" {
  profile = "robotics_robot_stack_prod-admin"
  alias   = "robotics_robot_stack_prod"

  region = "us-east-1"

  default_tags {
    tags = {
      ou = "robotics"
    }
  }
}

