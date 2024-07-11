module "tkgs_cluster" {
  source = "../modules/tkgs-cluster" 
}

module "tmc_backup_schedule" {
  source = "../modules/tmc-backup"
}