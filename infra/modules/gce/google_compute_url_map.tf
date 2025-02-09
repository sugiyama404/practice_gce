resource "google_compute_url_map" "url_map" {
  name = "http-url-map"

  default_service = google_compute_backend_service.backend_service.id

  host_rule {
    hosts        = ["*"]
    path_matcher = "http-path-matcher"
  }

  path_matcher {
    name            = "http-path-matcher"
    default_service = google_compute_backend_service.backend_service.id
  }
}
