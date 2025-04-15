# iac-demo

Ensure Prisma Cloud > Settings > Enterprise is configured to examine H,C,M,L severities (below creates M,L). Enable if necessary and wait for sync to GH (could take up to 12 hours).

Add a file 's3v2.tf' to the repo with below code. Commit. Create a PR.

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

Upon completion of demo, delete/cleanup unmerged PRs and branches.
