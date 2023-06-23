# sonarqube

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_sonarqube"></a> [sonarqube](#requirement\_sonarqube) | >= 0.16.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_sonarqube"></a> [sonarqube](#provider\_sonarqube) | 0.16.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [sonarqube_group.codeowners](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/group) | resource |
| [sonarqube_group.developers](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/group) | resource |
| [sonarqube_permissions.admin](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/permissions) | resource |
| [sonarqube_permissions.codeviewer](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/permissions) | resource |
| [sonarqube_permissions.teams](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/permissions) | resource |
| [sonarqube_project.repo](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/project) | resource |
| [sonarqube_project_main_branch.repo](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/project_main_branch) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codeowners_name"></a> [codeowners\_name](#input\_codeowners\_name) | n/a | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | n/a | yes |
| <a name="input_developers_name"></a> [developers\_name](#input\_developers\_name) | n/a | `string` | n/a | yes |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | n/a | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | n/a | <pre>map(object({<br>    description        = optional(string, "")<br>    default_branch     = optional(string, "")<br>    protected_branches = optional(set(string), [])<br>    visibility         = optional(string, "private")<br>    topics             = optional(set(string), [])<br>    homepage_url       = optional(string, "")<br>    has_issues         = optional(bool, false)<br>    is_template        = optional(bool, false)<br>    template           = optional(string, null)<br>    archived           = optional(bool, false)<br>    archive_on_destroy = optional(bool, true)<br>    advanced_security  = optional(bool, true)<br>    dependabot         = optional(bool, true)<br>    secret_scanning    = optional(bool, true)<br>    code_scanners      = optional(set(string), [])<br>    codeql_languages   = optional(set(string), ["java"])<br>    reusable_workflows = optional(bool, false)<br>    security_scanners  = optional(set(string), [])<br>    teams_access       = optional(map(string), {})<br>    auto_codeowners    = optional(bool, false)<br>    gitlab_mirror      = optional(string, "") # cloud, onprem or ""<br>    gitlab_url         = optional(string, "") # path<br>  }))</pre> | `{}` | no |
| <a name="input_sonarqube_user"></a> [sonarqube\_user](#input\_sonarqube\_user) | n/a | `string` | `"admin"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
