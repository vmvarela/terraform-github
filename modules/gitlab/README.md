# gitlab

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | >= 15.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab.cloud"></a> [gitlab.cloud](#provider\_gitlab.cloud) | 16.0.3 |
| <a name="provider_gitlab.onprem"></a> [gitlab.onprem](#provider\_gitlab.onprem) | 16.0.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_project_mirror.gitlab](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_mirror) | resource |
| [gitlab_project_mirror.gitlab_onprem](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_mirror) | resource |
| [gitlab_project.gitlab_cloud](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/data-sources/project) | data source |
| [gitlab_project.gitlab_onprem](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/data-sources/project) | data source |
| [gitlab_project_protected_branches.gitlab_cloud](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/data-sources/project_protected_branches) | data source |
| [gitlab_project_protected_branches.gitlab_onprem](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/data-sources/project_protected_branches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_mirror_auth"></a> [github\_mirror\_auth](#input\_github\_mirror\_auth) | github.com username:token | `string` | `""` | no |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | n/a | `string` | `""` | no |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | n/a | <pre>map(object({<br>    description        = optional(string, "")<br>    default_branch     = optional(string, "")<br>    protected_branches = optional(set(string), [])<br>    visibility         = optional(string, "private")<br>    topics             = optional(set(string), [])<br>    homepage_url       = optional(string, "")<br>    has_issues         = optional(bool, false)<br>    is_template        = optional(bool, false)<br>    template           = optional(string, null)<br>    archived           = optional(bool, false)<br>    archive_on_destroy = optional(bool, true)<br>    advanced_security  = optional(bool, true)<br>    dependabot         = optional(bool, true)<br>    secret_scanning    = optional(bool, true)<br>    code_scanners      = optional(set(string), [])<br>    codeql_languages   = optional(set(string), ["java"])<br>    reusable_workflows = optional(bool, false)<br>    security_scanners  = optional(set(string), [])<br>    teams_access       = optional(map(string), {})<br>    auto_codeowners    = optional(bool, false)<br>    gitlab_mirror      = optional(string, "") # cloud, onprem or ""<br>    gitlab_url         = optional(string, "") # path<br>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
