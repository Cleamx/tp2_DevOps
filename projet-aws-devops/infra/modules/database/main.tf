resource "aws_db_subnet_group" "this" {
  name       = "${var.db_identifier}-subnet-group"
  subnet_ids = var.subnet_ids
  tags = { Name = "${var.db_identifier}-sg" }
}

resource "aws_db_instance" "this" {
  identifier         = var.db_identifier
  engine             = "postgres"
  instance_class     = var.db_instance_class
  allocated_storage  = 20
  name               = "appdb"
  username           = var.db_username
  password           = var.db_password
  multi_az           = true
  publicly_accessible = true
  db_subnet_group_name = aws_db_subnet_group.this.name
  skip_final_snapshot = true
  tags = { Name = var.db_identifier }
}

output "db_endpoint" { value = aws_db_instance.this.address }
