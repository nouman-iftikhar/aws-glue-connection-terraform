resource "aws_glue_connection" "aws_glue" {
  name = var.glue_connection_name
  connection_properties = {
    JDBC_CONNECTION_URL = "jdbc:mysql://${var.db_endpoint}/${var.db_name}"
    PASSWORD            = var.glue_connection_password
    USERNAME            = var.glue_connection_username
  }

  physical_connection_requirements {
    security_group_id_list = [var.security_group]
    subnet_id              = var.subnet_id
  }
}