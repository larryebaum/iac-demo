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
    git_modifiers        = "65456094+bmppa/bm.almeida"
    git_org              = "larryebaum"
    git_repo             = "iac-demo"
    yor_trace            = "8cebc6f3-14b0-4a60-bd65-7988a2c206f1"
    yor_name             = "data"
  }
}
# Comment for PR
