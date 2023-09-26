resource  "aws_instance" "roboshop"{
    for_each = var.instances
    ami = var.ami_id
    security_groups = [ aws_security_group.allow_all.name ]
    instance_type = each.value
    tags = {
        Name = each.key
    }
}
resource "aws_route53_record" "DNS" {
    for_each = aws_instance.roboshop
    zone_id = var.zone_id
    name = "${each.key}.${var.domain}"
    type = "A"
    ttl = 1
    records = [ each.key == "web" ? each.value.public_ip : each.value.private_ip ]
}
output "aws_instance_info" {
  value = aws_instance.roboshop[*].private_ip
}  