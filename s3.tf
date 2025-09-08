resource "aws_s3_bucket" "raw" {
  bucket = coalescelist([var.s3_bucket_name, "${var.project}-raw-${var.account_id}"])[0]

  tags = {
    Name    = "${var.project}-raw"
    Project = var.project
  }
}

resource "aws_s3_bucket_acl" "raw_acl" {
  bucket = aws_s3_bucket.raw.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "raw_versioning" {
  bucket = aws_s3_bucket.raw.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ✅ Separate resource for encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "raw_encryption" {
  bucket = aws_s3_bucket.raw.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ✅ Use aws_s3_object instead of aws_s3_bucket_object
resource "aws_s3_object" "prefix_raw" {
  bucket  = aws_s3_bucket.raw.id
  key     = "raw-excel-data/"
  content = ""
}
