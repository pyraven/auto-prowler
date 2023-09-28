# Intro

I was playing around with https://github.com/prowler-cloud/prowler the other day and figured I'd configure an automatic daily scan via Cloud Run, one of GCP's serverless services on one of my projects.

This configuration exports a JSON and HTML to a GCS bucket.

## Prerequisites
```
git clone https://github.com/pyraven/auto-prowler
```
Enable Container API to upload Docker Image
https://console.cloud.google.com/marketplace/product/google/container.googleapis.com?project=<project_id>

## Build image locally and push to GCP

Ensure Docker Desktop is running, you have recently authenticated to [GCP](https://cloud.google.com/sdk/gcloud/reference/auth/login), and you have GCP/docker auth [configured](https://cloud.google.com/sdk/gcloud/reference/auth/configure-docker) before running the following commands:
```
cd auto-prowler/
cd build/
docker build -t auto-prowler:1.0 .
docker tag auto-prowler:1.0 gcr.io/<project_id>/auto-prowler:1.0;
docker push gcr.io/<project_id>/auto-prowler:1.0
```
## Run Terraform
```
cd ../terraform
```
Edit variables.tf variables:
- project_id
- cloud_run_container_path
- bucket_name

Save then run the terraform
```
terraform init
terraform plan
terraform apply
```
Then you can go to https://console.cloud.google.com/run/jobs?project=<project_id> and execute a run.

Cheers!