resource "aws_launch_template" "app_instances" {
  for_each = var.app_components

  name                   = "${each.key}-${var.env}"
  image_id               = var.ami
  instance_type          = each.value["instance_type"]
  vpc_security_group_ids = [aws_security_group.app_sg[each.key].id]
  user_data              = base64encode(templatefile("${path.module}/userdata.sh", { component = each.key, env = var.env }))

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${each.key}-${var.env}"
    }
  }

}

resource "aws_lb_target_group" "app_target_group" {
  for_each = var.app_components

  name     = "${each.key}-${var.env}"
  port     = each.value["ports"]["app"]
  protocol = "HTTP"
  vpc_id   = var.default_vpc_id

}


resource "aws_autoscaling_group" "app_instances" {
  for_each = var.app_components

  name               = "${each.key}-${var.env}"
  availability_zones = ["us-east-1a","us-east-1b"]
  desired_capacity   = each.value["min_nodes"]
  max_size           = each.value["max_nodes"]
  min_size           = each.value["min_nodes"]
  target_group_arns  = [aws_lb_target_group.app_target_group[each.key].arn]

  launch_template {
    id      = aws_launch_template.app_instances[each.key].id
    version = "$Latest"
  }
}



