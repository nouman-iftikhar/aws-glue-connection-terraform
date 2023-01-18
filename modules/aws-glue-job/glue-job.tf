resource "aws_glue_job" "example" {
  name     = "example"
  role_arn = var.iam-role-arn

  command {
    script_location = "s3://${var.bucket-name}/example.py"
  }
}