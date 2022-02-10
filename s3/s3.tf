resource "aws_s3_bucket" "metadata-s3" {
  bucket = var.s3-bucket-name 
  acl    = "private"
  
  tags = {
    Name        = "My bucket"
    Environment = "Test"
  }
}


output "s3-bucket-arn" {
  value = aws_s3_bucket.metadata-s3.arn
  
}

variable "s3-bucket-name" {
  description = "Give your bucket a name"
}