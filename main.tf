data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

provider "aws" {
  region = var.region
}

resource "aws_db_instance" "rds_pg" {
  allocated_storage    = 100
  #allocated_storage    = 16000
  #apply_immediately = false
  #db_subnet_group_name = "db-subnetgrp"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  engine               = "postgres"
  engine_version       = "11.5"
  identifier           = "cloudopss-test-lab"
  instance_class       = "db.m5.large"
  password             = "PasswdCOTestLAB"
  skip_final_snapshot  = true
  storage_encrypted    = true
  username             = "pgAdmin"
}