resource "aws_instance" "test-terraform-web" {
  ami                    = var.ami
  instance_type          = var.instance-type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.test-terraform-sg.id]
  subnet_id = aws_subnet.practico-terraform-subnet.id
  tags = {
    Name = "test-terraform-web"
  }
}

resource "null_resource" "remote_setup" {
  depends_on = [aws_instance.test-terraform-web]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = aws_instance.test-terraform-web.public_ip
    private_key = file(var.path_key)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "echo 'Hola Mundo' | sudo tee /var/www/html/index.html"
    ]
  }
}
