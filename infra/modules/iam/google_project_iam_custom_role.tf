resource "google_project_iam_custom_role" "custom_role" {
  role_id     = "customComputeRole"
  title       = "Custom Compute Role"
  description = "Custom role to allow compute.disks.create and compute.images.get"
  project     = var.project_id

  permissions = [
    "compute.disks.create",
    "compute.images.get",
  ]
}

