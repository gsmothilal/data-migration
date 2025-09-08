# Redshift Role
resource "aws_iam_role" "redshift" {
  name = "${var.project}-redshift-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Principal = { Service = "redshift.amazonaws.com" },
      Effect    = "Allow"
    }]
  })
}

# Attach FULL access (for practice only)
resource "aws_iam_role_policy_attachment" "redshift_full" {
  role       = aws_iam_role.redshift.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRedshiftFullAccess"
}
resource "aws_iam_role_policy_attachment" "redshift_s3_full" {
  role       = aws_iam_role.redshift.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Glue Role
resource "aws_iam_role" "glue" {
  name = "${var.project}-glue-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Principal = { Service = "glue.amazonaws.com" },
      Effect    = "Allow"
    }]
  })
}

# Attach FULL access (for practice only)
resource "aws_iam_role_policy_attachment" "glue_service_role" {
  role       = aws_iam_role.glue.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}
resource "aws_iam_role_policy_attachment" "glue_s3_full" {
  role       = aws_iam_role.glue.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_role_policy_attachment" "glue_redshift_full" {
  role       = aws_iam_role.glue.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRedshiftFullAccess"
}