resource "aws_s3_bucket" "example" {
  bucket = "jmtfproject-bucket"

  tags = {
    Name       = "jmtfproject-bucket"
    Department = "Training"
    Project    = "DevOps"
  }
}
