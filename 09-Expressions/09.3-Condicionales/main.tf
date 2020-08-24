# Resources

## AWS IAM User
resource "aws_iam_user" "lb_true" {
  count = var.user_bool == true ? 1 : 0
  name = "user_true"
  path = "/system"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_user" "lb_false" {
  count = var.user_bool == false ? 1 : 0
  name = "user_false"
  path = "/system"

  tags = {
    tag-key = "tag-value"
  }
}