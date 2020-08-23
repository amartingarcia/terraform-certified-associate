resource "aws_instance" "local_myec2" {
   ami = data.aws_ami.app_ami.id
   instance_type = var.instance_type
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}