resource "aws_instance" "terrafrom-practice"{
    ami = var.ami_id
    instance_type = var.instance_type
    security_groups = [aws_security_group.allow_all.name]
}