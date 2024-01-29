#------------------------------------------------------------------------------------------------------------------------
#
#                                                (Service Accounts)
#
#------------------------------------------------------------------------------------------------------------------------

# 1 Add the service account id/display-name below (naming convention <resource-sa)
locals {
  service_account_id = [
    "cloud-build-sa",
    "compute-engine-sa",
    "cloud-run-sa"
  ]
}

# 2 Add list of role to the appropriate <resource-roles> key-value pair. Create one if needed & add roles
#---link to roles (https://cloud.google.com/iam/docs/understanding-roles#cloud-run-roles)---

locals {
  cloud-build-roles = [
    "roles/cloudbuild.builds.builder",
    "roles/cloudbuild.builds.approver",
    "roles/cloudbuild.builds.editor",
    "roles/artifactregistry.admin" 
  ]
  compute-engine-roles = [
    "roles/compute.admin"
  ]
  cloud-run-roles = [
    "roles/run.admin",
    "roles/run.invoker",
    "roles/artifactregistry.admin"
  ]
}

#------------------------------------------------------------------------------------------------------------------------
#                                          Service Account Resource
#------------------------------------------------------------------------------------------------------------------------
resource "google_service_account" "service_accounts" {
  project      = var.project_id
  for_each     = toset(local.service_account_id)
  account_id   = each.value
  display_name = each.value

}

output "service_account_email" {
  value = google_service_account.service_accounts
}


#------------------------------------------------------------------------------------------------------------------------
#                                                   Roles
#------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------
#                                                Cloud Build
#------------------------------------------------------------------------------------------------------------------------
# resource "google_project_iam_member" "cloud_build_roles" {
#   project  = var.project_id
#   member   = "serviceAccount:cloud-build-sa@${var.project_id}.iam.gserviceaccount.com"
#   for_each = toset(local.cloud-build-roles)
#   role     = each.value

  
# }
#------------------------------------------------------------------------------------------------------------------------

