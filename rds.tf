resource "aws_db_instance" "default" {
  allocated_storage    = 10
  identifier          = local.TAG_PREFIX
  engine               = var.RDS_ENGINE
  engine_version       = var.RDS_ENGINE_VERSION
  instance_class       = var.RDS_INSTANCE_CLASS
  username             = "admin"
  password             = "admin123"
  parameter_group_name = aws_db_parameter_group.main.name
  vpc_security_group_ids = [aws_security_group.main.id]
  db_subnet_group_name = aws_db_subnet_group.main.name
  skip_final_snapshot  = true
}