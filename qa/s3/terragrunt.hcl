include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-aws-modules/s3-bucket/aws?version=3.3.0"
}
