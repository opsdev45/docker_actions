terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region 		  = "eu-west-2" 
}

# Create instance
resource "aws_instance" "ubuntu" {
  ami           = "ami-01ec84b284795cbc7"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  
  tags = {
   Name = "prod"
  }
  
  user_data = "${file("deploy_docker.sh")}"
}

resource "aws_security_group" "instance_sg" {
  name        = "test-terraform-prod"
  description = "Security Group"

  dynamic "ingress" {
    for_each = [22,8000]

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow inbound traffic on port ${ingress.value}"
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
