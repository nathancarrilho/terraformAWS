resource "aws_instance" "dev4" {
  ami = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}


resource "aws_instance" "dev5" {
  ami = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_db_instance.mysql]
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "dbmysql"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}