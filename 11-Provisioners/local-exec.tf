resource "aws_instance" "local_myec2" {
   ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"

   provisioner "local-exec" {
    command = "echo ${aws_instance.local_myec2.private_ip} >> private_ips.txt"
  }
}