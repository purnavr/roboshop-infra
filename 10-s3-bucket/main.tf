resource "aws_s3_bucket" "bucket" {
  bucket = "roboz-st"
}

resource "aws_s3_bucket_versioning" "version" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "protection" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = data.aws_kms_key.id.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

data "aws_kms_key" "id" {
  key_id = "b9a7a9d4-3407-4db9-bb33-360bb0835e6f"
}



