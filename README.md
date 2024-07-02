# tmc-terraform

Create TKGs Class based cluster using TMC Terraform provider

## Terraform Commands

cd terraform/

### Create Cluster (initial)
terraform init

terraform plan -var-file="dev.tfvars"

terraform apply -var-file="dev.tfvars"

### Destroy cluster
terraform destroy -var-file="dev.tfvars"

### Update Local State (.terraform.tfstate)
terraform apply -var-file="dev.tfvars" --refresh-only

### Turn on TF-LOG to file
export TF_LOG="DEBUG"
export TF_LOG_PATH="tf-debug.txt"

### Turn on TF-LOG at CLI
TF_LOG="DEBUG" terraform apply .......

### Look at state
cat terraform.tfstate
terraform state list
terraform state show tanzu-mission-control_tanzu_kubernetes_cluster.tkgs_cluster