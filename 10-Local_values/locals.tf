locals {
  name = "${var.name != "" ? var.name : var.default}"
  common_tags = {
    Project = "testing"
    "Team"  = "devops"
  }
}