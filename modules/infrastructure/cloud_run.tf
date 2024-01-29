#------------------------------------------------------------------------------------------------------------------------
#                                                (Cloud-Storage)                               
#------------------------------------------------------------------------------------------------------------------------


# resource "google_cloud_run_service" "craft_run" {
#   name     = "mine-craft-server"
#   location = "us-central1"

#   template {
#     spec {
#       containers {
#         image = "us-central1-docker.pkg.dev/project-1-sandbox-1223/docker-repo/mine-craft/itzg/minecraft-server:latest"
#       }
#     }
#     metadata {
#         annotations = {
#         "autoscaling.knative.dev/maxScale" = "3"
#         }
      
#     }
#   }

#   traffic {
#     percent         = 100
#     latest_revision = true
#   }
# }