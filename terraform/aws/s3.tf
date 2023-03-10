# Create a bucket where objects can be public
resource "aws_s3_bucket" "public_bucket" {
  bucket = "my-public-bucket-${random_string.random.result}"

  tags = {
    Privacy              = "public"
    Proj                 = "prisma-cloud-pov"
    git_commit           = "1670341c0841ca8c51d2df78f1763df0bd7aa8e2"
    git_file             = "terraform/aws/s3.tf"
    git_last_modified_at = "2023-03-10 05:01:47"
    git_last_modified_by = "65456094+bmppa@users.noreply.github.com"
    git_modifiers        = "65456094+bmppa"
    git_org              = "bmppa"
    git_repo             = "iac-demo"
    yor_trace            = "44ae1e94-f927-4080-b773-680933278250"
  }
}
