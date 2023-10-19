output "project_ids" {
  description = "The project IDs."
  value       = toset(values(google_project.project)[*].project_id)
}

output "folder_ids" {
  description = "The project folder."
  value       = toset(values(google_project.project)[*].folder_id)
}

output "project_numbers" {
  description = "The numeric identifier of the project."
  value       = toset(values(google_project.project)[*].number)
}
