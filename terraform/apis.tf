resource "google_project_service" "compute_api" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "kubernetes_api" {
  service = "container.googleapis.com"
}

resource "google_project_service" "cloudbuild_api" {
  service = "cloudbuild.googleapis.com"
}

resource "google_project_service" "cloudrsrcmgnt_api" {
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "cloudrun_api" {
  service = "run.googleapis.com"
}

resource "google_project_service" "cloudscheduler_api" {
  service = "cloudscheduler.googleapis.com"
}