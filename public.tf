resource "aws_key_pair" "app-instance-key" {
  key_name = "key-pair"
  public_key = tls_private_key.key-pair.public_key_openssh
}
