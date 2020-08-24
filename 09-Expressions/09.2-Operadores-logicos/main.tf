# Resources

## AWS IAM User
resource "aws_iam_user" "lb" {
  count = (1 * 2) + 1
  name = "loadbalancer.${count.index}"
  path = var.user_paths[count.index]

  tags = {
    tag-key = "tag-value"
  }
}