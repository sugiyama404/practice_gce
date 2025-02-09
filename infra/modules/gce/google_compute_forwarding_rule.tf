resource "google_compute_forwarding_rule" "http_forwarding_rule" {
  name        = "http-forwarding-rule"
  ip_address  = google_compute_address.static_ip.address
  ip_protocol = "TCP"
  port_range  = "80"
  target      = google_compute_target_http_proxy.http_proxy.id
}
