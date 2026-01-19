# --------------------------------------------------------------------------------------------------
# LEVEL 1: Top-Level Folders
# Creates: foundation, development, production
# --------------------------------------------------------------------------------------------------
module "level_1" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 4.0"

  parent = "organizations/${var.org_id}"

  # 3 folders at the root
  names = [
    "foundation",
    "development",
    "production"
  ]
}

# --------------------------------------------------------------------------------------------------
# LEVEL 2: Foundation Layer
# Creates: foundation/networking
# --------------------------------------------------------------------------------------------------
module "level_2_foundation" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 4.0"

  # TRICKY PART: We look up the ID of the 'foundation' folder we just created above
  parent = module.level_1.ids["foundation"]

  names = ["networking"]
}

# --------------------------------------------------------------------------------------------------
# LEVEL 2: Development Layer
# Creates: development/projects
# --------------------------------------------------------------------------------------------------
module "level_2_dev" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 4.0"

  parent = module.level_1.ids["development"]

  names = ["projects"]
}

# --------------------------------------------------------------------------------------------------
# LEVEL 2: Production Layer
# Creates: production/projects
# --------------------------------------------------------------------------------------------------
module "level_2_prod" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 4.0"

  parent = module.level_1.ids["production"]

  names = ["projects"]
}
