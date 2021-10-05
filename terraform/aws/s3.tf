resource "aws_s3_bucket" "data" {
  # bucket is public
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "my-bucket-835799"
  acl           = "public-read"
  force_destroy = true
  tags = {
    git_commit           = "7615def883560bd6169d34d3cbe017b3e2a4cce7"
    git_file             = "terraform/aws/s3.tf"
    git_last_modified_at = "2021-10-05 15:00:19"
    git_last_modified_by = "bm.almeida@gmail.com"
    git_modifiers        = "bm.almeida"
    git_org              = "bmppa"
    git_repo             = "iac-demo"
    yor_trace            = "64133b93-61cb-4f03-8e62-b0628fc534cd"
  }
  hosted_zone_id = "Z3AQBSTGFYJSTF"
  request_payer = "BucketOwner"
  versioning = {"enabled": false, "mfa_delete": false}
}
