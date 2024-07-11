# TMC Terraform Automation


## TKGs Cluster Configuration
To change cluster configuration edit the {clustername}.auto.tfvars file in the {clustername} folder and commit to github repo.  HCP workspaces use VCS to monitor a repo for each cluster.

{clustername folder}..
- {clustername}.auto.tfvars :  Change variables for cluster using this file
- provider.tf : control tanzu-mission-control provider version and tanzu mission control endpoint and API (sensitive secret in HCP via variable set TF_VAR_vmw_cloud_api_token).  Note you must add new workspaces to this variable set.
- variables.tf : declares variables used in {clustername}.auto.tfvars and tkg-clusterclass.tf file
- tkg-clusterclass.tf : resource file for tanzu kubernetes cluster
- use kubectl get tkr -l '!run.tanzu.vmware.com/legacy-tkr' in supervisor namespace to list compabatible TKR versions available for class based clusters