resource "google_compute_instance" "vm-from-tf" {
  name         = "gce-from-terraform"
  zone         = var.zone
  machine_type = "n1-standard-2"

  allow_stopping_for_update = true

  network_interface {
    network    = var.vpc_network_name
    subnetwork = var.subnet_sg_name
    access_config {} # 外部IPを自動的に割り当て
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    set -e
    apt-get update -y && apt-get install -y python3
    echo "Starting Python HTTP server on port 8000"
    nohup python3 -m http.server 8000 > /var/log/http_server.log 2>&1 &
  EOT

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20250123"
      size  = 35

    }
    auto_delete = false
  }

  labels = {
    env = "tflearning"
  }


  scheduling {
    preemptible       = false
    automatic_restart = false
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  lifecycle {
    ignore_changes = [
      attached_disk
    ]
  }
}
