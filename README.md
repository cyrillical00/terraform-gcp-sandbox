# terraform-gcp-sandbox

A learning sandbox for provisioning GCP infrastructure with Terraform. Deploys a VPC, subnet, and Compute Engine instance.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) (`gcloud`)
- A GCP project with billing enabled
- Application Default Credentials configured:
  ```bash
  gcloud auth application-default login
  ```

## Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/cyrillical00/terraform-gcp-sandbox.git
   cd terraform-gcp-sandbox
   ```

2. Copy the example vars file and fill in your values:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. Edit `terraform.tfvars` with your GCP project ID and preferred region.

## Usage

```bash
# Initialize Terraform and download providers
terraform init

# Preview what will be created
terraform plan

# Apply the configuration
terraform apply

# Destroy all resources when done
terraform destroy
```

## Resources Created

- `google_compute_network` — custom VPC
- `google_compute_subnetwork` — subnet in your chosen region
- `google_compute_instance` — e2-micro VM (free tier eligible)

## Notes

- Never commit `terraform.tfvars` — it's gitignored
- State is stored locally (`terraform.tfstate`) — also gitignored
