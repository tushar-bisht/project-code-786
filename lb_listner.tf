resource "aws_lb_listener" "jenkins" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type         = "forward"
    forward {
      target_group{
        arn = aws_lb_target_group.jenkins.arn
	  }
      target_group{
        arn = aws_lb_target_group.app.arn
          }

  }
}
}


resource "aws_lb_listener_rule" "jenkins" {
  listener_arn = aws_lb_listener.jenkins.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins.arn
  }

  condition {
    path_pattern {
      values = ["/jenkins/*"]
    }
  }

}

resource "aws_lb_listener_rule" "jenkins_only" {
  listener_arn = aws_lb_listener.jenkins.arn
  priority     = 102

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.jenkins.arn
  }

  condition {
    path_pattern {
      values = ["/jenkins"]
    }
  }

}


resource "aws_lb_listener_rule" "app" {
  listener_arn = aws_lb_listener.jenkins.arn
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }

  condition {
    path_pattern {
      values = ["/app/*"]
    }
  }

}

resource "aws_lb_listener_rule" "app_only" {
  listener_arn = aws_lb_listener.jenkins.arn
  priority     = 103

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }

  condition {
    path_pattern {
      values = ["/app"]
    }
  }

}
