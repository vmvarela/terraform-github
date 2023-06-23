# docs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 5.28.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository_file.team_md](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codeowners"></a> [codeowners](#input\_codeowners) | n/a | `set(string)` | `[]` | no |
| <a name="input_developers"></a> [developers](#input\_developers) | n/a | `set(string)` | `[]` | no |
| <a name="input_doc_repository"></a> [doc\_repository](#input\_doc\_repository) | n/a | `string` | `""` | no |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | n/a | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | n/a | <pre>map(object({<br>    description        = optional(string, "")<br>    default_branch     = optional(string, "")<br>    protected_branches = optional(set(string), [])<br>    visibility         = optional(string, "private")<br>    topics             = optional(set(string), [])<br>    homepage_url       = optional(string, "")<br>    has_issues         = optional(bool, false)<br>    is_template        = optional(bool, false)<br>    template           = optional(string, null)<br>    archived           = optional(bool, false)<br>    archive_on_destroy = optional(bool, true)<br>    advanced_security  = optional(bool, true)<br>    dependabot         = optional(bool, true)<br>    secret_scanning    = optional(bool, true)<br>    code_scanners      = optional(set(string), [])<br>    codeql_languages   = optional(set(string), ["java"])<br>    reusable_workflows = optional(bool, false)<br>    security_scanners  = optional(set(string), [])<br>    teams_access       = optional(map(string), {})<br>    auto_codeowners    = optional(bool, false)<br>    gitlab_mirror      = optional(string, "") # cloud, onprem or ""<br>    gitlab_url         = optional(string, "") # path<br>  }))</pre> | `{}` | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `""` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
