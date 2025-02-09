# サービスアカウントにカスタムロールを付与
resource "google_project_iam_member" "cloud_run_admin" {
  project = var.project_id
  role    = google_project_iam_custom_role.custom_role.name
  member  = "serviceAccount:${google_service_account.main.email}"
}
