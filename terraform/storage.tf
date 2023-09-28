resource "google_storage_bucket" "auto-prowler-report-buckets" {
  name                     = var.bucket_name
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}

resource "google_storage_bucket_iam_member" "report-bucket-sa" {
  bucket = google_storage_bucket.auto-prowler-report-buckets.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.auto_prowler_service_account.email}"
}