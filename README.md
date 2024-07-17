# TMC Terraform Automation

This repo provides an example use the Tanzu Mission Control Terraform module.  This example creates the following to create an enterprise ready set of resources for a developer team or LOB.

- TMC Cluster Group
- Velero backup automatically enabled on each cluster added to the cluster group
- Flux Controller enabled on each cluster added to the cluster group
- Flux Helm Controller enabled on each cluster added to the cluster group
- Github Repo for the cluster group used by Flux and Helm to install common packages or addons (argo, vault and Istio in this example)
- Provisions 3 TKGs clusters in the cluster group
- Provisions 3 AKS clusters in the cluster group
- Creates daily Velero backup schedules on each cluster

## Layout

tmc-terraform
- addons
  - argocd
  - istio-helm
  - start
  - vault
- modules
  - aks-cluster
  - clustergroup
  - tkgs-cluster
  - tmc-backup
- team-a
  - aks
    - clusterlist.tf
    - main.tf
    - provider.tf
    - team-a-aks.auto.tfvars
    - variables.tf
  - tkgs
    - clusterlist.tf
    


## TKGs Cluster Configuration
To change cluster configuration edit the {clustername}.auto.tfvars file in the {clustername} folder and commit to github repo.  HCP workspaces use VCS to monitor a repo for each cluster.

{clustername folder}..
- {clustername}.auto.tfvars :  Change variables for cluster using this file
- provider.tf : control tanzu-mission-control provider version and tanzu mission control endpoint and API (sensitive secret in HCP via variable set TF_VAR_vmw_cloud_api_token).  Note you must add new workspaces to this variable set.
- variables.tf : declares variables used in {clustername}.auto.tfvars and tkg-clusterclass.tf file
- tkg-clusterclass.tf : resource file for tanzu kubernetes cluster
- use kubectl get tkr -l '!run.tanzu.vmware.com/legacy-tkr' in supervisor namespace to list compabatible TKR versions available for class based clusters