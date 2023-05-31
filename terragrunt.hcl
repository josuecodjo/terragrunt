# remote_state {
#   backend = "s3"
#   generate = {
#     path      = "backend.tf"
#     if_exists = "overwrite_terragrunt"
#   }
#   config = {
#     bucket = "my-terraform-state"

#     key = "${path_relative_to_include()}/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "my-lock-table"
#   }
# }

#########################################################
###################### remote state #####################
#########################################################

remote_state {
  backend = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    path = "../all-states/${path_relative_to_include()}/terraform.tfstate"
  }
}
