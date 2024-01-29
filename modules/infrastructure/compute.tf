#------------------------------------------------------------------------------------------------------------------------
#                                                (Compute Engine VM)                               
#------------------------------------------------------------------------------------------------------------------------

resource "google_compute_instance" "playground_vm" {
    name         = "playground-vm"
    project      = var.project_id
    machine_type = "n2-micro-n2"
    zone         = "us-central-1a"

    tags = ["debain-vm", "playground"]

    boot_disk {
      initialize_params {
        image = "debain-cloud/debian-11"
      }
    }
    network_interface {
      network = "default"
    }
  
}