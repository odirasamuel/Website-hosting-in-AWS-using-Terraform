# Website-hosting-in-AWS-using-Terraform
This repo contains terraform configurations for setting up static website hosting using S3 Buckets, Route53, CloudFront and ACM 

### Stacks vs modules

The two components of this infrastructure directory are local modules in the `modules` directory and stacks in other directories.

A "stack" in this context is a chunk of infrastructure, probably contained in a VPC, that serves some complete purpose in and of itself. You should be able to give it a good name; if you can't, you probably need to reconsider what it's doing.

A stack should almost entirely consist of instantiating and configuring modules and have very little root-level configuration outside of that. Each stack has a separate terraform backend and state file from each other stack. This lets us plan and deploy each stack without affecting the others.

Modules in `modules`, on the other hand, should be content-agnostic; reusable; and focused on providing a single component of a larger stack - a VPC with its attendant configuration, or a hosting + CDN + DNS setup. A stack will probably use multiple modules.

### Workspaces

It's nice to be able to have different versions of a stack with different expectations around change controls, to provide a space for testing out changes both to the stack's infrastructure and to its eventual content. We do this with [terraform workspaces](https://www.terraform.io/language/state/workspaces). There is one set of workspaces for each stack: one named `prod`, one named `staging`, and one named `dev`.

#### Usage

To check your current workspace

```terraform
terraform workspace show
```

To create a new workspace, say `staging`

```terraform
terraform workspace new staging
```

To switch to another workspace say, `prod`

```terraform
terraform workspace select prod
```

### To create a new vpc, for instance, in `dev` environment for python-package-index stack

Make sure you are in the right workspace, confirm by running the code

```terraform
terraform workspace show
```

If not create a new workspace called `dev`

Next;
Add the module block below to the `vpc.tf`

```terraform
module "dev_vpc" {
  count                 = (terraform.workspace == "dev") ? 1 : 0
  source                = "../modules/vpc"
  availability_zones    = var.availability_zones
  cidr_block            = var.cidr_block
  public_subnets_count  = var.public_subnets_count
  public_subnets_cidr   = var.public_subnets_cidr
  private_subnets_count = var.private_subnets_count
  private_subnets_cidr  = var.private_subnets_cidr
  nat_gateway_count     = var.nat_gateway_count
  elastic_ips           = var.elastic_ips
  providers = {
    aws = aws.dev
  }
}
```

Initialize, plan and apply the configuration

```terraform
terraform init

terraform plan -out tf_plan -var-file="ppi.tfvars"

terraform apply "tf_plan"
```