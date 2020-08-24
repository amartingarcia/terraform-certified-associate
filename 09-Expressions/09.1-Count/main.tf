# Resources

## AWS IAM User
resource "aws_iam_user" "lb" {
  count = 3
  name = "loadbalancer.${count.index}"
  path = var.user_paths[count.index]

  tags = {
    tag-key = "tag-value"
  }
}