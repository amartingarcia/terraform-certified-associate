resource "aws_lb" "test" {
  name               = var.string # Variable tipo String
  internal           = var.bool   # Variable tipo Bool
  load_balancer_type = "network"
  subnets            = var.list # Variable tipo List

  enable_deletion_protection = true

  tags = var.map # Variable tipo Map
}

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = var.number # Variable tipo Number
  protocol = "HTTP"
  vpc_id   = "vpc-1234"
}

resource "aws_lb_listener" "test" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.test.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }

  condition {
    path_pattern {
      values = ["/static/*"]
    }
  }

  condition {
    host_header {
      values = ["example.com"]
    }
  }
}