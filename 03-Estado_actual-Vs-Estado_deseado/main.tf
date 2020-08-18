# Resources

## AWS IAM User
resource "aws_iam_user" "lb" {
  name = "loadbalancer2"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}