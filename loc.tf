resource "local_file" "key-pair" {
  content = tls_private_key.key-pair.private_key_pem
  filename = "key-pair.pem"
}
