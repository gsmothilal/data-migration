resource "aws_s3_bucket" "raw" {
  bucket = coalescelist([var.s3_bucket_name, "${var.project}-raw-${var.account_id}"])[0]
  acl    = "private"

  tags = {
    Name    = "${var.project}-raw"
    Project = var.project
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Create only the raw folder prefix
resource "aws_s3_bucket_object" "prefix_raw" {
  bucket  = aws_s3_bucket.raw.id
  key     = "raw-excel-data/"
  content = ""
}