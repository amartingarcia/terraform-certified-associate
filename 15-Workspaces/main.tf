resource "aws_instance" "remote_myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = lookup(var.instance_type,terraform.workspace)
  key_name      = "amartin-terraform"
}