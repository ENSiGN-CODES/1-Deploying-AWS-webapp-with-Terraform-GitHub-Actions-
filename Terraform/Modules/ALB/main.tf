#-------------Application Load Balancer-------------------#
resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = [var.public_subnet_1_id, var.public_subnet_2_id]
}

#-------------Target Group-------------------#
resource "aws_lb_target_group" "target_group" {
  health_check {
    interval            = 25
    path                = "/"
    protocol            = "HTTP"
    timeout             = 8
    healthy_threshold   = 5
    unhealthy_threshold = 3
  }

  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

#-------------Target Group Attachments-------------------#
resource "aws_lb_target_group_attachment" "instance_1" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = var.instance_1_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "instance_2" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = var.instance_2_id
  port             = 80
}

#-------------Listener-------------------#
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
