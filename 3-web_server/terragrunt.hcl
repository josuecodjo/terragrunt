include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../1-network", "../2-bd_gw"]
}