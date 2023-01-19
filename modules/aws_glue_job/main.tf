resource "aws_glue_job" "glue_job" {
  name     = var.glue_job_name
  role_arn = var.iam_role_arn

  command {
    script_location = "s3://${var.bucket_name}/example.py"
  }
}