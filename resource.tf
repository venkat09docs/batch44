data "aws_ami" "aws_linux_2_latest" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

resource "aws_instance" "webserver" {
    ami           = data.aws_ami.aws_linux_2_latest.id
    instance_type = var.instance_type
    user_data = file("./scripts/install_httpd.sh")
    user_data_replace_on_change = true

    vpc_security_group_ids = [aws_security_group.webserver_sg.id]
    tags = var.custom_tags
}

resource "aws_security_group" "webserver_sg" {
  name        = "webserver sg"
  description = "Allow Http server traffic"

  dynamic "ingress" {
      iterator = port
      for_each = var.sg_ports
      content {
          description      = "Ingress Rule"
          from_port        = port.value
          to_port          = port.value
          protocol         = "tcp"
          cidr_blocks      = [var.cidr_block]
      }
  }

  egress {
    from_port        = var.egress_port
    to_port          = var.egress_port
    protocol         = "-1"
    cidr_blocks      = [var.cidr_block]
  }

  tags = {
    Name = "Webserver SG"
  }
}
