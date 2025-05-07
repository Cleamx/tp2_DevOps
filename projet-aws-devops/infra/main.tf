terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 4.0" }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.region
}

module "network" {
  source       = "./modules/network"
  vpc_cidr     = var.vpc_cidr
  public_azs   = var.public_azs
  private_azs  = var.private_azs
}

module "database" {
  source            = "./modules/database"
  subnet_ids        = module.network.private_subnet_ids
  db_identifier     = var.db_identifier
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = var.db_instance_class
}

resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Allow HTTP inbound from internet"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-sg"
  }
}

module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = "app-cluster"
  subnet_ids         = module.network.public_subnet_ids
  security_group_ids = [aws_security_group.app_sg.id]
  vpc_id             = module.network.vpc_id
  container_definitions = [
    {
      name  = "backend"
      image = "122610518396.dkr.ecr.eu-west-3.amazonaws.com/backend:latest"
      port  = 4000
      env = [
        { name = "DB_HOST",  value = module.database.db_endpoint },
        { name = "DB_USER",  value = var.db_username },
        { name = "DB_PASS",  value = var.db_password },
        { name = "DB_NAME",  value = "appdb" }
      ]
    },
    {
      name  = "frontend"
      image = "122610518396.dkr.ecr.eu-west-3.amazonaws.com/frontend:latest"
      port  = 80
    }
  ]
}
