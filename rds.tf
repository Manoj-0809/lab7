resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "virat"
  password             = "virat1818"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
resource "aws_instance" "instance1" {
  ami                         = "ami-0195204d5dce06d99"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "test"
  vpc_security_group_ids     = ["sg-0640ac226b79673e7"]
  subnet_id                   = "subnet-001dafb658ac7d5b2"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"

  tags = {
    Name = "demoinstance"
  }
}
