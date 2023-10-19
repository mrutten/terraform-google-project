variable "billing_account" {
  description = "The ID of the billing account."
  type        = string
}
variable "org_id" {
  description = "The ID of the organisation."
  type        = number
}

variable "projects" {
  description = "The projects to create."
  type = map(object({
    project_name = string
    folder_id    = optional(string, null)
  }))
}

variable "member" {
  description = "The member that will run Terraform manifests."
  type        = string
}

variable "role" {
  description = "The role to assign to the Terraform user."
  type        = string
}
