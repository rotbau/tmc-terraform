# TMC Terraform Automation

This repo provides an example use the Tanzu Mission Control Terraform module.  This example creates the following to create an enterprise ready set of resources for a developer team or LOB.

- TMC Cluster Group
- Velero backup automatically enabled on cluster group and uses cluster label to enable or disable backup on specific clusters
- Flux Controller enabled on each cluster added to the cluster group
- Flux Helm Controller enabled on each cluster added to the cluster group
- Github Repo for the cluster group used by Flux and Helm to install common packages or addons (argo, vault and Istio in this example)
- Provisions 3 TKGs clusters in the cluster group
- Provisions 3 AKS clusters in the cluster group
- Creates daily Velero backup schedules for each cluster in the cluster group based on cluster label match expression

## Repo Layout

├── addons
│   └── base                       <---- Flux/Kustomize code for addons.  Can add additional
│       ├── argocd
│       ├── istio-helm
│       ├── start                  <---- Start kustomize.yaml drives specific addon installs
│       └── vault
├── modules                     
│   ├── aks-cluster                <---- AKS cluster creation module
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── tkgs-cluster               <---- TKGs cluster creation module
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── tmc-cg-backup-schedule     <---- TMC cluster group level backup module
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── tmc-cl-backup-schedule     <---- TMC cluster level backup module (not using but can be turned on for TKGs clusters in TKGs main.tf)
│   │   ├── main.tf
│   │   └── variables.tf
│   └── tmc-clustergroup           <---- TMC cluster group creation module (also enables helm, flux, velero data protection)
│       ├── main.tf
│       └── variables.tf
├── README.md
└── team-a                         <---- Example workflows for team-a.  Creates 3 aks clusters, 3 tkgs clusters, cluster group in TMC with cluster group backup schedule.  
    ├── aks
    │   ├── clusterlist.tf         <---- Defines AKS clusters to be created and cluster specific variables
    │   ├── main.tf                <---- Modules defined here
    │   ├── provider.tf
    │   ├── team-a-aks.auto.tfvars <---- Defines variables that are less likely to change
    │   └── variables.tf
    ├── tkgs
    │   ├── clusterlist.tf         <---- Defines TKGs clusters to be created and cluster specific variables
    │   ├── main.tf                <---- Modules defined here
    │   ├── provider.tf
    │   ├── team-a-tkg.auto.tfvars <---- Defines variables that are less likely to change
    │   └── variables.tf
    └── tmc-clustergroup
        ├── main.tf
        ├── provider.tf
        ├── team-a-tmc.auto.tfvars
        └── variables.tf
    
My implementation defines each directory under team-a as a workspace in Terrafrom.  However can be combined however you need.  Team-a folder can be replicated and adjusted for each team you need to manage infrastructure for.

To-Do: Add EKS cluster creation
 
## TMC Cluster Group Configuration

## AKS Cluster Configuration

## TKGs Cluster Configuration

## Addon Configuration