variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone to deploy the compute instance"
  type        = string
  default     = "us-central1-a"
}

variable "environment" {
  description = "Environment label (e.g. sandbox, dev, prod)"
  type        = string
  default     = "sandbox"
}

variable "ssh_source_ranges" {
  description = "CIDR ranges allowed to reach SSH (tcp/22). No default: set explicitly, e.g. your own address as x.x.x.x/32, or the IAP range 35.235.240.0/20 for IAP TCP forwarding."
  type        = list(string)

  validation {
    condition     = length(var.ssh_source_ranges) > 0 && !contains(var.ssh_source_ranges, "0.0.0.0/0") && !contains(var.ssh_source_ranges, "::/0")
    error_message = "ssh_source_ranges must be non-empty and must not open SSH to the whole internet (0.0.0.0/0 or ::/0)."
  }
}
