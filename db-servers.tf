resource "aws_instance" "db_instances" {
  for_each = var.db_components

  ami                    = var.ami
  instance_type          = each.value["instance_type"]
  vpc_security_group_ids = [aws_security_group.ec2[each.key].id]
  user_data              = templatefile("${path.module}/userdata.sh", { component = each.key, env = var.env })

  tags = {
    Name = "${each.key}-${var.env}"
  }

}

resource "aws_route53_record" "db_a_records" {
  for_each = var.db_components
  zone_id  = var.zone_id
  name     = "${each.key}-${var.env}"
  type     = "A"
  ttl      = 30
  records  = [aws_instance.db_instances[each.key].private_ip]
}



