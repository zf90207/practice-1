resource "aws_s3_bucket" "site_asset_bucket" {
  bucket = "${var.aws_root_name}-${var.aws_environment_name}-s3-frontend-${var.aws_region_name}"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "${var.aws_root_name}-${var.aws_environment_name}-s3-frontend-${var.aws_region_name}"
    Environment = var.aws_environment_name
  }
}

resource "aws_s3_bucket_public_access_block" "s3blockpublic" {
  bucket                  = aws_s3_bucket.site_asset_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
