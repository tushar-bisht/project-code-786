data "http" "myip" {
  url = "https://api.ipify.org/"
}

resource "aws_security_group" "bastion_sg" {
  name        = "project-code-786-bastion-sg"
  description = "Allow SSH inbound traffic form My IP"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "SSH from MY IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "project-code-786-bastion-sg"
  }
}


resource "aws_security_group" "private_sg" {
  name        = "project-code-786-private-sg"
  description = "Allow ALL inbound traffic from VPC"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["192.168.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "project-code-786-private-sg"
  }
}


resource "aws_security_group" "public_sg" {
  name        = "project-code-786-public-sg"
  description = "Allow HTTP inbound traffic from MY IP"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "project-code-786-public-sg"
  }
}
