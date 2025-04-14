resource "aws_s3_bucket" "example_private_bucket" {
  bucket = "kwan-example-private-bucket"
  tags = {
    yor_name  = "example_private_bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "example_private_bucket" {
  bucket = aws_s3_bucket.example_private_bucket.id

  block_public_acls   = false
  block_public_policy = true
}
