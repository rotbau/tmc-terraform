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
```
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
```    
My implementation defines each directory under team-a as a workspace in Terrafrom.  However can be combined however you need.  Team-a folder can be replicated and adjusted for each team you need to manage infrastructure for.

### To-Do
- Add EKS cluster creation
- Multiple NTP to TKGs clusters
- Refine addon code
 
## TMC Cluster Group Configuration

This creates a cluster group for the team in TMC, defines a github repo for addon installation, enables helm and flux and configures a cluster group backup job using cluster label selectors to enable on clusters in the group.

```
└── team-a 
    └── tmc-clustergroup
        ├── main.tf
        ├── provider.tf
        ├── team-a-tmc.auto.tfvars
        └── variables.tf
```
**main.tf** - calls the tmc-clustergroup and tmc-cg-backup-schedule modules and also passes the variables to the modules.  The tmc-cg-backup-schedule depends on the tmc-clustergroup module.

**provider.tf** - defines TMC provider.  Appears I need provider both here and in the module since TMC is a 3rd party/partner provider.

**tema-a-tkg.auto.tfvars** - defines the variables for clustergroup, github flux repo, kustomize job(s) and backup schedule 

**variables.tf** - defines variables

## AKS Cluster Configuration

This section along with the als-cluster module creates AKS clusters using the TMC Terraform provider.

```
└── team-a  
    ├── aks
    │   ├── clusterlist.tf
    │   ├── main.tf
    │   ├── provider.tf
    │   ├── team-a-aks.auto.tfvars
    │   └── variables.tf
```
**clusterlist.tf** - defines the clusters and commonly changed variables to create.  You can add or removed sections as needed.  This example creates 3 clusters (dev, stage, prod).  Variables that change less common per cluster are defined in the team-a-tkg-auto.tfvars.  You can shift other variables you plan to frequently change from the team-a-tkg-auto.tfvars to the clusterlist.tf if desired.  You will then need to change the main.tf file with the appropriate `each.value ` variable.  Note this is a fairly minimal AKS cluster in terms of customization.

**main.tf** - calls the aks-cluster module and passes the variables to the module.  Also generates a random 4 digit number to append to the cluster name.  There is a commented out section that would create a per-cluster velero backup job.  This isn't be used here as we are created a cluster group level job instead using label selectors.  Per cluster backup not working on AKS or EKS due to the way we name the cluster.

**provider.tf** - defines TMC provider.  Appears I need provider both here and in the module since TMC is a 3rd party/partner provider.

**tema-a-tkg.auto.tfvars** - defines less commonly changed cluster variables and TMC backup job (not used). Named auto.tfvars so HCP picks the variables up.  

**variables.tf** - defines variables

## TKGs Cluster Configuration

This section along with the tkgs-cluster module creates TKG service clusters using the TMC Terraform provider.

```
└── team-a  
    ├── tkgs
    │   ├── clusterlist.tf         <---- Defines TKGs clusters to be created and cluster specific variables
    │   ├── main.tf                <---- Modules defined here
    │   ├── provider.tf
    │   ├── team-a-tkg.auto.tfvars <---- Defines variables that are less likely to change
    │   └── variables.tf
```
**clusterlist.tf** - defines the clusters and commonly changed variables to create.  You can add or removed sections as needed.  This example creates 3 clusters (dev, stage, prod).  Variables that change less common per cluster are defined in the tkg/team-a-tkg-auto.tfvars.  You can shift other variables you plan to frequently change from the tkg/team-a-tkg-auto.tfvars to the tkg/clusterlist.tf if desired.  You will then need to change the tkgs/main.tf file with the appropriate `each.value ` variable.

**main.tf** - calls the tkgs-cluster module and passes the variables to the module.  Also generates a random 4 digit number to append to the cluster name.  There is a commented out section that would create a per-cluster velero backup job in TMC.  This isn't be used here as we are created a cluster group level job instead using label selectors.  Code is here for example.

**provider.tf** - defines TMC provider.  Appears I need provider both here and in the module since TMC is a 3rd party/partner provider.

**tema-a-tkg.auto.tfvars** - defines less commonly changed cluster variables and TMC backup job (not used).  Named auto.tfvars so HCP picks the variables up.  

**variables.tf** - defines variables

## Addon Configuration