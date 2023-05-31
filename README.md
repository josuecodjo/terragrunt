# Terraform Docker

## Getting started
---

### Install Terraform and terragrunt

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install terragrunt
```


### let's dive IN
```
terragrunt plan
terragrunt apply
terragrunt output
terragrunt destroy

terraform init  # Prepare your working directory for other commands
terraform fmt   # Reformat your configuration in the standard style
terraform validate   # Check whether the configuration is valid
terraform plan  # Show changes required by the current configuration
terraform apply # Create or update infrastructure
terraform destroy    # Destroy previously-created infrastructure
```
- 1-network creates the docker network and the output is the network name saved in tfstate
- 2-bd_gw create zabbix java gateway and mysql server based on the output of 1-network
- 3-web_server creates the Zabbix server and Zabbix web based on the outputs of 1-network and 2-bd_gw

- Clone the repository and move into it
```
cd 1-network && terragrunt plan
terragrunt apply
cd ..
cd 2-bd_gw && terragrunt plan
terragrunt apply
cd ..
cd 3-web_server && terragrunt plan
terragrunt apply
```
- Server will be accessible on http://localhost:80 with user Admin and pass zabbix