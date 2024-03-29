#------------------------------------------------------------------------------------------------------------------------
#                                                (Google Artifact Repo)                               
#------------------------------------------------------------------------------------------------------------------------

variable "gar_config" {
  type = map(list(string))
  default = {
    "DOCKER"       = ["docker-repo", "terraform-repo"]
    "MAVEN"        = ["maven-repo"]
    "APT"          = ["apt-repo"]
    "YUM"          = ["yum-repo"]
    "PYTHON"       = ["python-repo"]
  }
}


#------------------------------------------------------------------------------------------------------------------------
#                                             Artifact Registry Resource                                
#------------------------------------------------------------------------------------------------------------------------

resource "google_artifact_registry_repository" "gar_repo" {
  for_each      = var.gar_config

  project       = var.project_id
  location      = "us-central1"
  repository_id = each.value[0]
  format        = each.key
  
}

#------------------------------------------------------------------------------------------------------------------------