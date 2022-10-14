resource "null_resource" "example2" {
  provisioner "local-exec" {
    command = <<EOF

curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"
cd /tmp
unzip -o mysql.zip
cd mysql-main

mysql -u${jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["RDS_MYSQL_USER"]} -p${jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["RDS_MYSQL_PASS"]} -h ${aws_db_instance.default.address} <shipping.sql

EOF
  }
}


