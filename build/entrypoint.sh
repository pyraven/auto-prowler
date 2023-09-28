#!/bin/bash

# Retrieve values from environment variables
PROJECT_ID=${PROJECT_ID}
BUCKET_NAME=${BUCKET_NAME}

# Run prowler
prowler gcp --project-ids ${PROJECT_ID} -M json html -o /tmp

# Sleep for 15 seconds
sleep 10

# Upload files to Google Cloud Storage
cd /tmp; gsutil cp *.json gs://${BUCKET_NAME}
cd /tmp; gsutil cp *.html gs://${BUCKET_NAME}