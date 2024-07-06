
resource "aws_instance" "instance1" {
  ami                         = "ami-0195204d5dce06d99"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "kohli"
  vpc_security_group_ids     = ["sg-0640ac226b79673e7"]
  subnet_id                   = "subnet-001dafb658ac7d5b2"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"

  tags = {
    Name = "klin"
  }
}
