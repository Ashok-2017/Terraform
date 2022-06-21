resource "aws_s3_bucket_object" "Object1" {
  depends_on = [aws_s3_bucket_object.special]
  bucket = "specialbucket12345"
  acl    = "public-read-write"
  key = "TERRAFORM-IMAGE1.JPG"
  source = "Project_2/TERRAFORM-IMAGE1.JPG"
}
