# Resources

## AWS IAM User
resource "aws_iam_user" "lb_true" {
  name = local.name
  path = "/system"

  tags = local.common_tags
}