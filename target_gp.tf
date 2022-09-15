resource "aws_lb_target_group" "jenkins" {
  name     = "project-code-786-jenkins"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  target_type = "instance"
}


resource "aws_lb_target_group_attachment" "jenkins-instance" {
  target_group_arn = aws_lb_target_group.jenkins.arn
  target_id        = module.jenkins_ec2_instance.id
  port             = 8080
}

resource "aws_lb_target_group" "app" {
  name     = "project-code-786-app"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  target_type = "instance"
}


resource "aws_lb_target_group_attachment" "app-instance" {
  target_group_arn = aws_lb_target_group.app.arn
  target_id        = module.app_ec2_instance.id
  port             = 8080
}


