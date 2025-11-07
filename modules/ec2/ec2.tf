# creating ec2 vm
resource "aws_instance" "example" {
  count = var.novm
  ami = var.vermah-ami-id
  instance_type = var.vm-size
  key_name      = aws_key_pair.example.key_name
  security_groups = [aws_security_group.allow_tls.name]
    # changing tags_all to tags
  tags = {
    "Name" = "${var.vm-name}-${count.index}"
  }
  depends_on = [ tls_private_key.example, aws_key_pair.example ]

  # provisioner "remote-exec" {
  #   inline = [ 
  #     "sudo dnf install git httpd -y",
  #     "mkdir -p hello/terraform"
  #    ]
    
  # }

  # connection {
  #   type = "ssh"
  #   user = "ec2-user"
  #   host = self.public_ip
  #   timeout = "3m"
  #   # content of private key data
  #   private_key = tls_private_key.example.private_key_pem
  # }


}
