module "security-group" {
  source      = "./modules/security_group"
  vpc_id      = var.vpc_id
  cidr_blocks = var.cidr_blocks

}

module "glue_connection" {
  source                   = "./modules/aws_glue_connection"
  glue_connection_name     = var.glue_connection_name
  glue_connection_password = var.glue_connection_password
  glue_connection_username = var.glue_connection_username
  db_endpoint              = var.db_endpoint
  db_name                  = var.db_name
  security_group           = module.security-group.security_group_id
  subnet_id                = var.subnet_id
}

module "glue_crawler" {
  source            = "./modules/aws_glue_crawler"
  glue_crawler_name = var.glue_crawler_name
  iam_role_arn      = module.iam.iam_role_arn
  db_name           = var.db_name
  glue_connection   = module.glue_connection.glue_connection_name
}

module "glue_job" {
  source        = "./modules/aws_glue_job"
  glue_job_name = var.glue_job_name
  bucket_name   = var.bucket_name
  iam_role_arn  = module.iam.iam_role_arn
}

module "iam" {
  source = "./modules/iam"
}
