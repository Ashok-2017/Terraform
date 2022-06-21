resource "null_resource" "nullmount" {
  depends_on = [aws_volume_attachment.attach_ebs]
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = tls_private_key.key-pair.private_key_pem
    host = aws_instance.web[0].public_ip
  }
  provisioner "remote_exec" {
   inline = [ 
     " sudo mkfs.ext4 /dev/xvdh",
     " sudo mount  /dev/xvdh /var/www/html",
     " sudo rm -rf /var/www/*",
     " sudo git clone https://github.com/Chuks-Blosom/Terraform-Project-2.git /var/www/html"
     ]
   }
}
