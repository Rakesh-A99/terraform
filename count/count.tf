resource "aws_instance" "counts" {
    count = 10
    ami = var.ami_id
    instance_type = var.instance_name[count.index] == "MongoDB" || var.instance_name[count.index] == "MySQL" ? "t3.medium" : "t2.micro"
    security_groups = [ aws_security_group.allow_all.name]
    tags = {
      name = var.instance_name[count.index]
    }
}
resource "aws_route53_record" "DNS" {
    count = 10
    zone_id = var.zone_id
    name = "${var.instance_name[count.index]}.${var.domain}" #interpolation
    ttl = 1 
    type = "A"
    records = [aws_instance.counts[count.index].private_ip]
}