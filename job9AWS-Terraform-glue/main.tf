provider "aws" {
  region = "us-east-1"
}

module "security-group" {
  source = "./modules/security-group"
  vpc-id = var.vpc_id
  cidr_blocks = var.cidr_blocks

}

module "glue-connection" {
    source = "./modules/aws-glue-connection"
    db-endpoint = var.db-endpoint
    database-name = var.database-name
    security_group = module.security-group.security_group_ID
    subnet_id = var.subnet_id
}

module "glue-crawler" {
  source = "./modules/aws-glue-crawler"
  iam-role-arn = module.iam.iam-role-arn
  database-name = var.database-name
  glue-connection = module.glue-connection.glue-connection-name
}
module "glue-job" {
  source = "./modules/aws-glue-job"
  bucket-name = var.bucket-name
  iam-role-arn = module.iam.iam-role-arn
}
module "iam" {
  source = "./modules/iam"  
}
