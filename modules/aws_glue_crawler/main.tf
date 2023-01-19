resource "aws_glue_crawler" "glue_crawler_jdbc" {
  name          = var.glue_crawler_name
  database_name = var.db_name
  role          = var.iam_role_arn

  jdbc_target {
    connection_name = var.glue_connection
    path            = "db_name/%"
  }
}