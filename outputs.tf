output "s3_bucket" { value = aws_s3_bucket.raw.bucket }
output "glue_database" { value = aws_glue_catalog_database.raw_db.name }
output "glue_crawler" { value = aws_glue_crawler.retail_crawler.name }
output "redshift_endpoint" { value = aws_redshift_cluster.main.endpoint }
output "redshift_port" { value = aws_redshift_cluster.main.port }
output "redshift_database" { value = var.redshift_database_name }
output "redshift_iam_role" { value = aws_iam_role.redshift.arn }