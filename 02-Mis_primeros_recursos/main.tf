# Resources

## AWS IAM User
resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

## AWS IAM Group
resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}