## Requirements

No requirements.

## Providers

| Name                                                       | Version |
| ---------------------------------------------------------- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                                               | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project)                                                   | resource |
| [google_project_default_service_accounts.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_default_service_accounts) | resource |

## Inputs

| Name                                                                              | Description                    | Type                                                                                                       | Default | Required |
| --------------------------------------------------------------------------------- | ------------------------------ | ---------------------------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account. | `string`                                                                                                   | n/a     |   yes    |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id)                            | The ID of the organisation.    | `number`                                                                                                   | n/a     |   yes    |
| <a name="input_project_ids"></a> [project\_ids](#input\_project\_ids)             | The ID of the projects.        | `set(string)`                                                                                              | n/a     |   yes    |
| <a name="input_projects"></a> [projects](#input\_projects)                        | The projects to create.        | <pre>map(object({<br>    project_name = string<br>    folder_id    = optional(string, null)<br>  }))</pre> | n/a     |   yes    |

## Outputs

| Name                                                                                | Description                            |
| ----------------------------------------------------------------------------------- | -------------------------------------- |
| <a name="output_folder_ids"></a> [folder\_ids](#output\_folder\_ids)                | The project folder.                    |
| <a name="output_project_ids"></a> [project\_ids](#output\_project\_ids)             | The project IDs.                       |
| <a name="output_project_numbers"></a> [project\_numbers](#output\_project\_numbers) | The numeric identifier of the project. |
