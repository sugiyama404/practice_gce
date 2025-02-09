resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 15
  zone = var.zone
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "adisk" {
  disk     = google_compute_disk.disk-1.id
  instance = google_compute_instance.vm-from-tf.id
}
