resource "google_compute_firewall" "firewall_allow_ingress" {
  name    = "firewall-allow-ingress"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = var.allowed_ingress_ports
  }

  source_ranges = var.allowed_ingress_sources
  priority      = 100
}

resource "google_compute_firewall" "firewall_allow_egress" {
  name    = "firewall-allow-egress"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = var.allowed_egress_ports
  }

  source_ranges = ["0.0.0.0/0"]
  priority      = 100
}
