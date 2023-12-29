#------------------------------------------------------------------------------------------------------------------------
#
#                                               Project-1-Sandbox
#                                              (main Configuration)
#------------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = "~> 1.6.6"
  backend "gcs" {
    bucket = "gcp-sandbox-tf-state-3812"
    prefix = "terraform/state"
    }
}

provider "google" {
    project = "project-1-sandbox-1223"
    region  = "us-central1"
  
}

module "infrastructure" {
  source = "./modules/infrastructure"
  
  project_id = var.project_id

}

#------------------------------------------------------------------------------------------------------------------------
#                                      Terraform State File Remote Loaction 
#------------------------------------------------------------------------------------------------------------------------

resource "random_integer" "random_number" {
  min = 1
  max = 10000
}

resource "google_storage_bucket" "tf-state" {
    name          = "gcp-sandbox-tf-state-${random_integer.random_number.result}"
    location      = "us-central1"
    project       = var.project_id
    storage_class = "STANDARD"
    force_destroy = false
    versioning {
      enabled     = true 
    }
    uniform_bucket_level_access = true
    depends_on = [ module.infrastructure.enabled_apis_output ]  #--v
}
# Enabaling APIs is in the infrastructure module, this depends on allows for the proper project APIs to be enabled before deploying resources in this module. 

#------------------------------------------------------------------------------------------------------------------------
#                                     
#------------------------------------------------------------------------------------------------------------------------