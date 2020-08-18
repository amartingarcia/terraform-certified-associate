data "terraform_remote_state" "dir1" {
  backend = "local"

  config = {
    path = "../dir1/terraform.tfstate"
  }
}