# creating ec2 vm
resource "aws_instance" "example" {
  ami = var.vermah-ami-id
  instance_type = var.vm-size
  key_name      = aws_key_pair.example.key_name
    # changing tags_all to tags
  tags = {
    "Name" = var.vm-name
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install git httpd -y",
      "mkdir -p hello/terraform"
     ]
    
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    # content of private key data
    private_key = tls_private_key.example.private_key_pem
  }
}
