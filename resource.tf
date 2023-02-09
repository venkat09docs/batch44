resource "aws_instance" "webserver" {
    ami           = "ami-01a4f99c4ac11b03c"
    instance_type = "t2.micro"
    user_data = file("./scripts/install_httpd.sh")
    user_data_replace_on_change = true

    vpc_security_group_ids = [aws_security_group.webserver_sg.id]
    tags = {
      Name = "webserver"
      Env = "Development"
    }
}

resource "aws_security_group" "webserver_sg" {
  name        = "webserver sg"
  description = "Allow Http server traffic"

  ingress {
    description      = "Webserver port"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Webserver SG"
  }
}
