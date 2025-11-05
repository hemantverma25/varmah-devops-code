# creating ec2 vm
resource "aws_instance" "example" {
  ami = var.vermah-ami-id
  instance_type = var.vm-size
  key_name      = var.ec2-key-name
  # changing tags_all to tags
  tags = {
    "Name" = var.vm-name
  }
}
