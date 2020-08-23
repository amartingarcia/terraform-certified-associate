resource "aws_instance" "remote_myec2" {
   ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"
   key_name = "amartin-terraform"

   provisioner "remote-exec" {
     inline = [
       "sudo amazon-linux-extras install -y nginx1.12",
       "sudo systemctl start nginx"
     ]

   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./amartin-terraform.pem")
     host = self.public_ip
   }
   }
}