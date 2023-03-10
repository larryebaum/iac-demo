# Create a bucket where objects can be public
resource "aws_s3_bucket" "public_bucket" {
  bucket = "my-public-bucket-${random_string.random.result}"

  tags = {
    Privacy   = "public"
    Proj      = "prisma-cloud-pov"
    yor_trace = "b8d57c0d-7a82-4b19-8e5d-ca372b327aa8"
  }
}
