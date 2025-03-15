provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "one" {
count = 4
ami = "ami-04aa00acb1165b32a"
instance_type = "t2.medium"
key_name = "todaykeypair"
vpc_security_group_ids = ["sg-099b5dfe1e93b463e"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "nexus", "tomcat", "tomcat-2"]
}
