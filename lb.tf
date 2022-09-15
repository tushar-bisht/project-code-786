resource "aws_lb" "alb" {
  name               = "project-code-786"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_sg.id]
  subnet_mapping {
    subnet_id     = module.vpc.public_subnets[0]
  }

  subnet_mapping {
    subnet_id     = module.vpc.public_subnets[1]
  }

  tags = {
    Environment = "dev"
  }
}
