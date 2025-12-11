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




