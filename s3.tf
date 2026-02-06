resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Create S3 Bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "klaudtechie-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "Vault Dynamic Secret Test"
    Environment = "Dev"
    ManagedBy = "Terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.demo_bucket.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}