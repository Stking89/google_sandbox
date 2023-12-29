#------------------------------------------------------------------------------------------------------------------------
#                                                (Cloud-Storage)                               
#------------------------------------------------------------------------------------------------------------------------

resource "random_integer" "random_number" {
  min = 1
  max = 10000
}


resource "google_storage_bucket" "build_logs" {
  name          = "cloud-build-logs-${random_integer.random_number.result}"
  location      = "us-central1"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true 

  lifecycle_rule {
    condition {
        age = 7
    }
    action {
      type = "Delete"
    }
  }
}