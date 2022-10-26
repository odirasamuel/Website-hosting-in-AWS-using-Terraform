module "dev_uploader" {
  count              = (terraform.workspace == "dev") ? 1 : 0
  source             = "../modules/uploader"
  domain_name        = var.domain_name
  thumbnail          = var.thumbnail
  stack_name         = var.stack_name
  website_bucket_arn = module.dev_web_hosting[0].website_bucket_arn
  providers = {
    aws = aws.dev
  }

  depends_on = [
    module.dev_web_hosting
  ]
}

module "staging_uploader" {
  count              = (terraform.workspace == "staging") ? 1 : 0
  source             = "../modules/uploader"
  domain_name        = var.domain_name
  thumbnail          = var.thumbnail
  stack_name         = var.stack_name
  website_bucket_arn = module.staging_web_hosting[0].website_bucket_arn
  providers = {
    aws = aws.prod
  }

  depends_on = [
    module.staging_web_hosting
  ]
}

module "prod_uploader" {
  count              = (terraform.workspace == "prod") ? 1 : 0
  source             = "../modules/uploader"
  domain_name        = var.domain_name
  thumbnail          = var.thumbnail
  stack_name         = var.stack_name
  website_bucket_arn = module.prod_web_hosting[0].website_bucket_arn
  providers = {
    aws = aws.prod
  }

  depends_on = [
    module.prod_web_hosting
  ]
}
