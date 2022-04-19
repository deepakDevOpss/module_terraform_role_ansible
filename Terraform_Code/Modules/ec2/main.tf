resource "aws_instance" "instance" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [var.security_gp_id]
  subnet_id =var.subnet
  associate_public_ip_address = true
  key_name =var.key_name


  root_block_device {
    delete_on_termination = true
    volume_size = 50
    volume_type = "gp2"
  }
  tags = {
    Name = var.Name
    environment = var.environment
  }

}