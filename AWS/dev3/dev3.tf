resource "aws_instance" "dev6" {
  ami = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}
