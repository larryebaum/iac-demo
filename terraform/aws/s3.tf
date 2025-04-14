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

resource "aws_s3_bucket" "data2" {
  # bucket is public
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "${local.resource_prefix.value}-data"
  force_destroy = true
  tags = merge({
    Name        = "${local.resource_prefix.value}-data"
    Environment = local.resource_prefix.value
    }, {
    git_commit           = "4d57f83ca4d3a78a44fb36d1dcf0d23983fa44f5"
    git_file             = "terraform/aws/s3.tf"
    git_last_modified_at = "2022-05-18 07:08:06"
    git_last_modified_by = "jmagee@paloaltonetworks.com"
    git_modifiers        = "34870196+LironElbaz/nimrod/nimrodkor/jmagee"
    git_org              = "bridgecrewio"
    git_repo             = "terragoat"
    yor_trace            = "0874007d-903a-4b4c-945f-c9c233e13243"
    }, {
    yor_name = "data"
  })
}
