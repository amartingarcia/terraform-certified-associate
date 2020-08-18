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

## AWS add user into group
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.lb.name,
  ]

  group = aws_iam_group.developers.name
}