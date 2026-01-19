provider "google" {
  project = var.project_id
  region  = var.region
}

# ---GCS Bucket for Terraform State ---
resource "google_storage_bucket" "tf_state" {
  name          = "tf-state-${var.project_id}"
  location      = var.region
  force_destroy = false

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}

# --- AC2: Terraform CI/CD Service Account ---
resource "google_service_account" "terraform_ci" {
  account_id   = "terraform-ci-sa"
  display_name = "Terraform CI/CD Automation Bot"
}

# --- AC3: Service Account Permissions ---

# 1. Allow SA to access the State Bucket
resource "google_storage_bucket_iam_member" "sa_bucket_admin" {
  bucket = google_storage_bucket.tf_state.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.terraform_ci.email}"
}

# 2. Allow SA to manage Folders (at Org level)
resource "google_organization_iam_member" "org_folder_admin" {
  org_id = var.org_id
  role   = "roles/resourcemanager.folderAdmin"
  member = "serviceAccount:${google_service_account.terraform_ci.email}"
}

# 3. Allow SA to manage Service Accounts (at Org level)
resource "google_organization_iam_member" "org_sa_admin" {
  org_id = var.org_id
  role   = "roles/iam.serviceAccountAdmin"
  member = "serviceAccount:${google_service_account.terraform_ci.email}"
}

# 4. Allow SA to create Projects (at Org level)
resource "google_organization_iam_member" "org_project_creator" {
  org_id = var.org_id
  role   = "roles/resourcemanager.projectCreator"
  member = "serviceAccount:${google_service_account.terraform_ci.email}"
}

# 5. Allow SA to manage the Organization (Required to read/write Org IAM)
resource "google_organization_iam_member" "org_admin" {
  org_id = var.org_id
  role   = "roles/resourcemanager.organizationAdmin"
  member = "serviceAccount:${google_service_account.terraform_ci.email}"
}