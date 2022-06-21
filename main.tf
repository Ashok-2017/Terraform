resource "aws_instance" "web" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  tags = {
       Name = "webserver1"
  }
  count = 1
  subnet_id = aws_subnet.my-app.subnet.id
  key_name = "key-pair"
  security_groups = [aws_security_group.app_sg.id]
  provisioner "remote-exec" {
  connection {
      type = "ssh"
      user = "ec2-user"
      private_key = tls_private_key.key-pair.private_key_pem
      host = aws_instance.web[0].public_ip
  }
  inline = [
   "sudo yum install httpd  php git -y",
       "sudo systemctl restart httpd",
       "sudo systemctl enable httpd",
  ]
 }
}	 
   
