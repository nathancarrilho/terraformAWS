resource "aws_instance" "dev1" {
  ami = "ami-ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev1"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev2" {
  ami = "ami-ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev2"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev3" {
  ami = "ami-ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev3"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_db_instance.db_postgresql]
}

resource "aws_db_instance" "db_postgresql" {
  allocated_storage    = 20
  engine               = "postgresql"
  engine_version       = "14.1"
  instance_class       = "db.t3.micro"
  db_name          = "mydbpostregresql"
  username             = "nathan"
  password             = "q1w2e3"
  parameter_group_name = "default.postgresql14"
  skip_final_snapshot  = true
}