resource "aws_s3_bucket" "data" {
  # bucket is public
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "my-bucket-83579"
  acl           = "public-read"
  force_destroy = true
}
