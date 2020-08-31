resource "aws_iam_user" "lb" {
  count = 5
  name = "loadbalancer${count.index}"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}