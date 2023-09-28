FROM --platform=linux/amd64 python:3.9-slim

# Install dependencies and utilities
RUN apt-get update && apt-get install -y curl tar gcc

# Install Google Cloud SDK
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-448.0.0-linux-x86_64.tar.gz \
    && tar zxvf google-cloud-sdk-448.0.0-linux-x86_64.tar.gz google-cloud-sdk \
    && ./google-cloud-sdk/install.sh

# Add gcloud to PATH
ENV PATH="/google-cloud-sdk/bin:${PATH}"

RUN mkdir -p /tmp
RUN pip install prowler gsutil

# Copy a local script into the container
COPY entrypoint.sh /entrypoint.sh

# Ensure the script is executable
RUN chmod +x /entrypoint.sh

# Set the script as the default command to execute
CMD ["/entrypoint.sh"]