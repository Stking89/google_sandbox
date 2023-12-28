resource "google_cloudbuild_trigger" "pr_trigger" {
  project  = var.project_id
  name     = "pr-trigger" 
  location = "us-central1"
  # service_account = "cloud-build-sa@${var.project_id}.iam.gserviceaccount.com"

  description = "Cloud Build trigger that will deploy resources on GCP"



  # Define the trigger configuration
  github {
    owner = "Stking89"
    name  = "google_sandbox"
    pull_request {
      branch = "main"  // Trigger on pushes to the main branch
    }
  }

  # Specify the build configuration (optional)
  included_files = ["modules/infrastructure/build_triggers/pull-request.yaml"]  // Path to your Cloud Build configuration file

  # Additional options (optional)
  filename = "modules/infrastructure/build_triggers/pull-request.yaml"  // Name of the build configuration file within the repository

}
