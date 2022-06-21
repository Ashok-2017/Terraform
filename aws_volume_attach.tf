resource "aws_volume_attachment" "attach_ebs" {
  depends_on = [aws_ebs_volume.myebs1]
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.myebs1.id
  instance_id = aws_instance.web[0].id
  force_detach = true
}
