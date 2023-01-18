resource "aws_glue_crawler" "glue-crawler-jdbc" {
  database_name = var.database-name
  name          = "glue-crawler-jdbc"
  role          = var.iam-role-arn

  jdbc_target {
    connection_name = var.glue-connection
    path            = "database-name/%"
  }
}