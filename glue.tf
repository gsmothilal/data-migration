resource "aws_glue_catalog_database" "raw_db" {
  name = "retail_raw_db"
}

resource "aws_glue_crawler" "retail_crawler" {
  name          = "retail_raw_crawler"
  role          = aws_iam_role.glue.arn
  database_name = aws_glue_catalog_database.raw_db.name

  s3_target {
    path = "s3://${aws_s3_bucket.raw.bucket}/raw-excel-data/"
  }

  configuration = <<EOF
{
  "Version": 1.0,
  "Grouping": {"TableGroupingPolicy":"CombineCompatibleSchemas"}
}
EOF
}