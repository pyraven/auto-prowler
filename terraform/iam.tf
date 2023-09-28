resource "google_service_account" "auto_prowler_service_account" {
  account_id   = "auto-prowler-service-account"
  display_name = "Auto Prowler Service Account"
}

resource "google_project_iam_member" "auto_prowler_iam_viewer_binding" {
  project = var.project_id
  role    = "roles/viewer"
  member  = "serviceAccount:${google_service_account.auto_prowler_service_account.email}"
}

resource "google_project_iam_member" "auto_prowler_iam_reviewer_binding" {
  project = var.project_id
  role    = "roles/iam.securityReviewer"
  member  = "serviceAccount:${google_service_account.auto_prowler_service_account.email}"
}

resource "google_project_iam_member" "auto_prowler_iam_stackdriver_binding" {
  project = var.project_id
  role    = "roles/stackdriver.accounts.viewer"
  member  = "serviceAccount:${google_service_account.auto_prowler_service_account.email}"
}

resource "google_service_account" "auto_prowler_trigger_service_account" {
  account_id   = "auto-prowler-trigger-sa"
  display_name = "Auto Prowler Trigger Service Account"
}

resource "google_project_iam_member" "auto_prowler_trigger_iam_binding" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "serviceAccount:${google_service_account.auto_prowler_trigger_service_account.email}"
}
