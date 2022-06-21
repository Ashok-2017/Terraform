resource "aws_s3_bucket_public_access_block" "public_storage" {
  depends_on = [aws_s3_bucket.special]
  bucket = "specialbucket12345"
  block_public_acls = false
  block_public_policy = false
}
