output "folder_id_foundation" {
  description = "The ID of the Foundation folder"
  value       = module.level_1.ids["foundation"]
}

output "folder_id_networking" {
  description = "The ID of the Networking folder (Foundation child)"
  value       = module.level_2_foundation.ids["networking"]
}

output "folder_id_development" {
  description = "The ID of the Development folder"
  value       = module.level_1.ids["development"]
}

output "folder_id_dev_projects" {
  description = "The ID of the Development Projects folder"
  value       = module.level_2_dev.ids["projects"]
}

output "folder_id_production" {
  description = "The ID of the Production folder"
  value       = module.level_1.ids["production"]
}

output "folder_id_prod_projects" {
  description = "The ID of the Production Projects folder"
  value       = module.level_2_prod.ids["projects"]
}
