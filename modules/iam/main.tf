resource "aws_iam_role" "aws_glue" {
  assume_role_policy  = data.aws_iam_policy_document.glue_role_policy.json
  managed_policy_arns = [aws_iam_policy.glue_policy.arn]
}

data "aws_iam_policy_document" "glue_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = [
        "glue.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_policy" "glue_policy" {

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = ["glue:*",
          "s3:GetBucketLocation",
          "s3:ListBucket",
          "s3:ListAllMyBuckets",
          "s3:GetBucketAcl",
          "cloudwatch:PutMetricData",
          "s3:GetObject",
        "s3:PutObject"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}