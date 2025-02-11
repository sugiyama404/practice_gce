resource "google_compute_backend_service" "backend_service" {
  name          = "http-backend-service"
  protocol      = "HTTP"
  health_checks = [google_compute_health_check.http_health_check.id]
}
