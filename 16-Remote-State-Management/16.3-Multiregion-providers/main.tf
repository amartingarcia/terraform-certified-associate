resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_eip" "lb2" {
  vpc      = true
  provider = aws.virginia
}