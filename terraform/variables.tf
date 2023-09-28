variable "project_id" {
  type    = string
  default = "<project_id>" # Edit
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "frequency" {
  type    = string
  default = "0 0 * * *"
}

variable "cloud_run_container_path" {
  type    = string
  default = "gcr.io/<project_id>/auto-prowler" # Edit
}

variable "cloud_run_container_path_version" {
  type        = string
  description = "GCR version path for container"
  default     = "1.0"
}

variable "bucket_name" {
  type    = string
  default = "<unique_bucket_name>" # Edit
}




