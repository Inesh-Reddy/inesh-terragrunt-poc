include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:infracloudio/terraform-aws-vpc.git"
}
