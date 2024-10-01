# resource "aws_s3_bucket" "my_bucket" {
#   bucket = var.s3_bucket
#   tags = {
#     Name        = var.instance_name
#     Environment = var.environment_tag
#     Owner       = var.owner
#     Project     = var.project
#   }
# }
# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = aws_s3_bucket.my_bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }