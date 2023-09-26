variable "ami_id" {

    default = "ami-03265a0778a880afb"
  
}

variable "instance_name" {

   default = ["MongoDB", "Cart", "Catalogue", "User" , "Redis", "MySQL", "RabbitMQ", "Shipping", "Payment", "Web"]
  
}

variable "instance_type" {

    default = "t2.micro"
  
}

variable "sg_name" {

    default = "allow_all"
  
}

variable "sg_cidr" {

    default = ["0.0.0.0/0"]
  
}

variable "tags" {
    default = {
        name = "mongodb"
        environment = "dev"
        project = "Roboshop"
        terraform = "true"
        component = "mongodb"
    }
}