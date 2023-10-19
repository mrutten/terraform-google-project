# Table of Contents

- [Table of Contents](#table-of-contents)
- [Introduction](#introduction)
- [Authentication](#authentication)
- [Workspace](#workspace)
- [Authorization](#authorization)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Modules](#modules)
  - [Resources](#resources)
  - [Inputs](#inputs)
  - [Outputs](#outputs)


# Introduction

This is a Terraform module that creates a number of GCP projects and does some housekeeping on them, e.g. disabling default service accounts, creating a Terraform entity, etc.

# Authentication

Use gcloud's Application Default Credentials ("ADCs") to authenticate by executing the following steps.

`gcloud auth application-default login --disable-quota-project --no-launch-browser`

Copy the URL to the browser that is logged in as the identity you want to use to Terraform, then copy-paste the authorization code.

The credentials will be saved to ~/.config/gcloud/application_default_credentials.json and will be used by any library that requests Application Default Credentials (ADC).

> If the warning below pops up, ignore it. There is no quota project, since the project will be created by Terraform.  
> WARNING:   
> Quota project is disabled. You might receive a "quota exceeded" or "API not enabled" error. Run $ gcloud auth application-default set-quota-project to add a quota project.

# Workspace

In Google Workspace, create a group, e.g. terraform@example.com. Give this group the roles mentioned under authorization below.
You can then add Cloud Identities as members of this group.

# Authorization

Whatever identity is used to Terraform, be it a service account, user or group, it needs permissions to bootstrap the Terraform manifest. 
Therefore, the identity needs the following roles at the organizational level;

- Billing Account User - to associate a billing account with the project
- Compute Shared VPC Admin - Administer Shared VPC
- Organization Role Viewer - To view the organizational roles
- Project Creator - to create a project
- Project Deleter - to delete project with `terraform destroy`
- Project IAM Admin - to assign roles on the project level to the Terraform user
- Quota Viewer - to check whether quota is granted for a new project
- Service Usage Viewer - to view services

Any group that needs to login to Compute Engine over SSH, needs the following organizational roles:

- Compute OS Login External User


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/5.2.0/docs/resources/project) | resource |
| [google_project_default_service_accounts.default](https://registry.terraform.io/providers/hashicorp/google/5.2.0/docs/resources/project_default_service_accounts) | resource |
| [google_project_iam_member.terraform](https://registry.terraform.io/providers/hashicorp/google/5.2.0/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account. | `string` | n/a | yes |
| <a name="input_member"></a> [member](#input\_member) | The member that will run Terraform manifests. | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The ID of the organisation. | `number` | n/a | yes |
| <a name="input_projects"></a> [projects](#input\_projects) | The projects to create. | <pre>map(object({<br>    project_name = string<br>    folder_id    = optional(string, null)<br>  }))</pre> | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | The role to assign to the Terraform user. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_folder_ids"></a> [folder\_ids](#output\_folder\_ids) | The project folder. |
| <a name="output_project_ids"></a> [project\_ids](#output\_project\_ids) | The project IDs. |
| <a name="output_project_numbers"></a> [project\_numbers](#output\_project\_numbers) | The numeric identifier of the project. |
