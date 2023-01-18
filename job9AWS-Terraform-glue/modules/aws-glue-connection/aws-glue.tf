resource "aws_glue_connection" "aws-glue" {
  connection_properties = {
    JDBC_CONNECTION_URL = "jdbc:mysql://${var.db-endpoint}/${var.database-name}"
    PASSWORD            = "examplepassword"
    USERNAME            = "exampleusername"
  }
  name = "aws-glue-jdbc"
  physical_connection_requirements {
    security_group_id_list = [var.security_group]
    subnet_id              = var.subnet_id
  }
}