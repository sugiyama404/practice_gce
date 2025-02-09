
resource "google_compute_subnetwork" "subnet_sg" {
  name                     = "subnet-sg"
  network                  = google_compute_network.vpc_network.id
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  private_ip_google_access = true

  depends_on = [google_compute_network.vpc_network]
}
