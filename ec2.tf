resource "aws_spot_instance_request" "spot" {
  ami           = data.aws_ami.ami
  instance_type = "t3.micro"

  tags = {
    Name = "CheapWorker"
  }
}