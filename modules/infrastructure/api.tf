#------------------------------------------------------------------------------------------------------------------------
#
#                                                       Required APIs
#
#------------------------------------------------------------------------------------------------------------------------

#---Add new APIs to locals list below---
#---Link to Google API Serviec List public repo (https://gist.github.com/coryodaniel/13eaee16a87a7fdca5e738123216862a)---

locals {
  google_apis = {
    "compute"                       = "compute.googleapis.com"
    "cloudresourcemanager"          = "cloudresourcemanager.googleapis.com"
    "storage"                       = "storage-api.googleapis.com"
    "iam"                           = "iam.googleapis.com"
    "cloudbilling"                  = "cloudbilling.googleapis.com"
    "cloudrun"                      = "run.googleapis.com"
    "cloudbuild"                    = "cloudbuild.googleapis.com"
    "secretmanager"                 = "secretmanager.googleapis.com"
  }
}


#---Enable APIs--- 

resource "google_project_service" "enabled_apis" {
    for_each = local.google_apis

  project = var.project_id
  service = each.value
}

output "enabled_apis_output" {
  value = google_project_service.enabled_apis
}

#------------------------------------------------------------------------------------------------------------------------