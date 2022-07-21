terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
  profile = "default"
}

resource "aws_instance" "drupal_web_server" {
  ami           = "ami-098e42ae54c764c35"
  instance_type = "t2.micro"
  count=3
  tags = {
    Name = "Week3-Web Server"
  }
}


resource "aws_instance" "drupal_app_server" {
  ami           = "ami-098e42ae54c764c35"
  instance_type = "t2.micro"

  tags = {
    Name = "Week3-App Server"
  }
}

resource "aws_db_instance" "drupal_db_server" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "Week3-DB"
  username             = "drupal"
  password             = "testdbserver"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  tags = {
    Name = "Week3-DB Server"
  }
}

