resource "aws_s3_bucket" "special" {
  bucket = "specialbucket12345"
  acl    = "public-read-write"
  region = "ap-southeast-1"
  versioning {
    enabled = true 
  }
  tags = {
    Name = "special"
    Environment = "SQA"
  }
  provisioner "local_exec" {
    command = "git clone https://github.com/Helen-Chukwukelu/Terraform-Project-2.git TERRAFORM-IMAGE1.JPG"
  }
}
 	

