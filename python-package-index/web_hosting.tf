module "dev_web_hosting" {
  count       = (terraform.workspace == "dev") ? 1 : 0
  source      = "../modules/web_hosting"
  domain_name = var.domain_name
  stack_name  = var.stack_name
  providers = {
    aws = aws.dev
  }
}

module "staging_web_hosting" {
  count       = (terraform.workspace == "staging") ? 1 : 0
  source      = "../modules/web_hosting"
  domain_name = var.domain_name
  stack_name  = var.stack_name
  providers = {
    aws = aws.prod
  }
}

module "prod_web_hosting" {
  count       = (terraform.workspace == "prod") ? 1 : 0
  source      = "../modules/web_hosting"
  domain_name = var.domain_name
  stack_name  = var.stack_name
  providers = {
    aws = aws.prod
  }
}
