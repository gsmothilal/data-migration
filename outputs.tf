output "s3_bucket" {
  description = "S3 bucket name for raw CSVs"
  value       = aws_s3_bucket.raw.bucket
}

output "glue_database" {
  description = "Glue database name"
  value       = aws_glue_catalog_database.raw_db.name
}

output "glue_crawler" {
  description = "Glue crawler name"
  value       = aws_glue_crawler.retail_crawler.name
}

output "redshift_endpoint" {
  description = "Redshift cluster endpoint"
  value       = aws_redshift_cluster.main.endpoint
}

output "redshift_port" {
  description = "Redshift port"
  value       = aws_redshift_cluster.main.port
}

output "redshift_database" {
  description = "Database name"
  value       = var.redshift_database_name
}

output "redshift_iam_role" {
  description = "IAM Role ARN for COPY"
  value       = aws_iam_role.redshift.arn
}