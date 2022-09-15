module "bastion_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "project-code-786-bastion"

  ami                    = "ami-08d4ac5b634553e16"
  instance_type          = "t2.micro"
  key_name               = "project-code-786-key-pair"
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


module "jenkins_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
 # version = "~> 3.0"

  name = "project-code-786-jenkins"

  ami                    = "ami-08d4ac5b634553e16"
  instance_type          = "t2.micro"
  key_name               = "project-code-786-key-pair"
#  monitoring             = true
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


module "app_ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
 # version = "~> 3.0"

  name = "project-code-786-app"

  ami                    = "ami-08d4ac5b634553e16"
  instance_type          = "t2.micro"
  key_name               = "project-code-786-key-pair"
#  monitoring             = true
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  subnet_id              = module.vpc.private_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
