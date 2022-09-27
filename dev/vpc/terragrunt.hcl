include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/vpc/vpc.hcl"
  # We want to reference the variables from the included config in this configuration, so we expose it.
  expose = true
}


inputs = {

}