resource "aws_instance" "conditions" {

    ami = var.ami_id 
    instance_type = var.instance_name == "mongodb" ? "t3.medium" : "t2.micro"
}

resource "aws_security_group" "allow_all" {
    name        = var.sg
    description = "Allow TLS inbound traffic"
    ingress {
        description      = "allow_all"
        from_port        = 0
        to_port          = 0
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }    

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
  
}

