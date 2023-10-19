/******************************************
	Project configuration
 *****************************************/
resource "google_project" "project" {
  for_each   = var.projects
  project_id = each.key
  name       = each.value.project_name

  auto_create_network = false
  billing_account     = var.billing_account
  folder_id           = each.value.folder_id
  org_id              = var.org_id
}

/******************************************
	Default service account configuration
 *****************************************/
resource "google_project_default_service_accounts" "default" {
  for_each = var.projects
  project  = google_project.project[each.key].project_id
  action   = "DISABLE"
}
