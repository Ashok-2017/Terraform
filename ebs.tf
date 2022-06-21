resource "aws_ebs_volume" "myebs1" {
  availability_zone = aws_instance.web[0].availability_zone
  size = 1
  tags = {
    Name = "ebsvol"
  }
}
