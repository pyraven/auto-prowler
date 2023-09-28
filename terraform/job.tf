resource "google_cloud_run_v2_job" "auto_prowler_cloudrun_job" {
  name     = "auto-prowler-cloudrun-job"
  location = var.region

  template {
    task_count = 1
    template {
      max_retries     = 0
      timeout         = "3600s"
      service_account = google_service_account.auto_prowler_service_account.email
      containers {
        image = "${var.cloud_run_container_path}:${var.cloud_run_container_path_version}"
        resources {
          limits = {
            memory = "2048Mi"
            cpu    = "2000m"
          }
        }
        ports {}
        env {
          name  = "PROJECT_ID"
          value = var.project_id
        }
        env {
          name  = "BUCKET_NAME"
          value = var.bucket_name
        }
      }
    }
  }
  depends_on = [google_project_service.cloudrun_api]
}

resource "google_cloud_scheduler_job" "auto_prowler_cloudrun_scheduler" {
  name      = "auto-prowler-cloudrun-scheduler"
  schedule  = var.frequency
  time_zone = "America/Chicago"

  http_target {
    http_method = "POST"
    uri         = "https://${google_cloud_run_v2_job.auto_prowler_cloudrun_job.location}-run.googleapis.com/apis/run.googleapis.com/v1/namespaces/${var.project_id}/jobs/${google_cloud_run_v2_job.auto_prowler_cloudrun_job.name}:run"

    oauth_token {
      scope                 = "https://www.googleapis.com/auth/cloud-platform"
      service_account_email = google_service_account.auto_prowler_trigger_service_account.email
    }
  }
  depends_on = [google_cloud_run_v2_job.auto_prowler_cloudrun_job, google_project_service.cloudscheduler_api]
}