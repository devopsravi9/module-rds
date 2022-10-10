resource "aws_db_subnet_group" "main" {
  name       = "${local.TAG_PREFIX}-subnetGroup"
  subnet_ids = var.PRIVATE_SUBNET_ID

  tags = {
    Name = "${local.TAG_PREFIX}-subnetGroup"
  }
}