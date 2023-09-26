variable "ami_id" {
    default = "ami-03265a0778a880afb"
}

variable "instances" {

    default = {

        mongodb = "t3.medium"
        MySQL = "t3.medium"
        Redis = "t2.micro"
        RabbitMQ = "t2.micro"
        Catalogue = "t2.micro"
        User = "t2.micro"
        Cart = "t2.micro"
        Shipping = "t2.micro"
        Payment = "t2.micro"
        Web = "t2.micro"

    }
  
}
 variable "sg" {

    default = "all"
   
 }

 variable "sg_cidr" {

    default = ["0.0.0.0/0"]
   
 }

 variable "zone_id" {
    default = "Z08892663AT899M4JPPZH"
 }
 variable "domain" {
    default = "myroboshop.site" 
 }
 variable "ingress" {
    
    type = list
    default = [
    {
        description      = "Allowing 80 inbound traffic"
        from_port        = 80 # this is number
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    },
    {
        description      = "Allowing 443 inbound traffic"
        from_port        = 443 # this is number
        to_port          = 443
        protocol         = "https"
        cidr_blocks      = ["0.0.0.0/0"]
    },
    {
        description      = "Allowing 22 inbound traffic"
        from_port        = 22 # this is number
        to_port          = 22
        protocol         = "ssh"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    ]
 }