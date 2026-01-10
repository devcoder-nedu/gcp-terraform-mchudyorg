output "bucket_name" {
  value = google_storage_bucket.tf_state.name
}

output "service_account_email" {
  value = google_service_account.terraform_ci.email
}

output "org_id" {
  value = var.org_id
}

output "project_id" {
  value = var.project_id
}

output "region" {
  value = var.region
}
