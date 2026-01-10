variable "project_id" {
  description = "The ID of the seed/admin project where bucket and SA will live"
  type        = string
}

variable "org_id" {
  description = "The Organization ID (numbers only)"
  type        = string
}

variable "region" {
  description = "Region for the bucket"
  type        = string
  default     = "us-central1"
}
