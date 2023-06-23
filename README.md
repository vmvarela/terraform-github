## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, < 2.0.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 5.25.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | 15.11.0 |
| <a name="requirement_sonarqube"></a> [sonarqube](#requirement\_sonarqube) | 0.15.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 5.25.0 |
| <a name="provider_gitlab.cloud"></a> [gitlab.cloud](#provider\_gitlab.cloud) | 15.11.0 |
| <a name="provider_gitlab.onprem"></a> [gitlab.onprem](#provider\_gitlab.onprem) | 15.11.0 |
| <a name="provider_sonarqube"></a> [sonarqube](#provider\_sonarqube) | 0.15.13 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_repository_access_level.repo](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/actions_repository_access_level) | resource |
| [github_actions_secret.sonar_token](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/actions_secret) | resource |
| [github_actions_variable.sonar_host_url](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/actions_variable) | resource |
| [github_branch_default.repo](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/branch_default) | resource |
| [github_branch_protection.repo](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/branch_protection) | resource |
| [github_repository.repo](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/repository) | resource |
| [github_repository_file.code_scanning](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/repository_file) | resource |
| [github_repository_file.codeowners](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/repository_file) | resource |
| [github_repository_file.security_testing](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/repository_file) | resource |
| [github_repository_file.team_md](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/repository_file) | resource |
| [github_team.codeowners](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/team) | resource |
| [github_team.developers](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/team) | resource |
| [github_team_membership.codeowners](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/team_membership) | resource |
| [github_team_membership.developers](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/team_membership) | resource |
| [github_team_repository.maintain](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/team_repository) | resource |
| [github_team_repository.push](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/team_repository) | resource |
| [github_team_repository.repo](https://registry.terraform.io/providers/integrations/github/5.25.0/docs/resources/team_repository) | resource |
| [gitlab_project_mirror.gitlab](https://registry.terraform.io/providers/gitlabhq/gitlab/15.11.0/docs/resources/project_mirror) | resource |
| [gitlab_project_mirror.gitlab_onprem](https://registry.terraform.io/providers/gitlabhq/gitlab/15.11.0/docs/resources/project_mirror) | resource |
| [sonarqube_group.codeowners](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.13/docs/resources/group) | resource |
| [sonarqube_group.developers](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.13/docs/resources/group) | resource |
| [sonarqube_permissions.admin](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.13/docs/resources/permissions) | resource |
| [sonarqube_permissions.codeviewer](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.13/docs/resources/permissions) | resource |
| [sonarqube_permissions.teams](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.13/docs/resources/permissions) | resource |
| [sonarqube_project.repo](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.13/docs/resources/project) | resource |
| [sonarqube_project_main_branch.repo](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.13/docs/resources/project_main_branch) | resource |
| [sonarqube_user_token.repo](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.13/docs/resources/user_token) | resource |
| [gitlab_project.gitlab_cloud](https://registry.terraform.io/providers/gitlabhq/gitlab/15.11.0/docs/data-sources/project) | data source |
| [gitlab_project.gitlab_onprem](https://registry.terraform.io/providers/gitlabhq/gitlab/15.11.0/docs/data-sources/project) | data source |
| [gitlab_project_protected_branches.gitlab_cloud](https://registry.terraform.io/providers/gitlabhq/gitlab/15.11.0/docs/data-sources/project_protected_branches) | data source |
| [gitlab_project_protected_branches.gitlab_onprem](https://registry.terraform.io/providers/gitlabhq/gitlab/15.11.0/docs/data-sources/project_protected_branches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codeowners"></a> [codeowners](#input\_codeowners) | n/a | `set(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `""` | no |
| <a name="input_developers"></a> [developers](#input\_developers) | n/a | `set(string)` | `[]` | no |
| <a name="input_github_mirror_auth"></a> [github\_mirror\_auth](#input\_github\_mirror\_auth) | github.com username:token | `string` | `""` | no |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | n/a | `string` | `""` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | github.com token (owner) | `string` | `""` | no |
| <a name="input_gitlab_cloud_token"></a> [gitlab\_cloud\_token](#input\_gitlab\_cloud\_token) | gitlab.com token | `string` | `""` | no |
| <a name="input_gitlab_onprem_token"></a> [gitlab\_onprem\_token](#input\_gitlab\_onprem\_token) | gitlab (on-prem) token | `string` | `""` | no |
| <a name="input_gitlab_onprem_url"></a> [gitlab\_onprem\_url](#input\_gitlab\_onprem\_url) | gitlab (on-prem) base url | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_parent_team_id"></a> [parent\_team\_id](#input\_parent\_team\_id) | n/a | `number` | `null` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | `""` | no |
| <a name="input_privacy"></a> [privacy](#input\_privacy) | n/a | `string` | `"closed"` | no |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | n/a | <pre>map(object({<br>    description        = optional(string, "")<br>    default_branch     = optional(string, "")<br>    protected_branches = optional(set(string), [])<br>    visibility         = optional(string, "private")<br>    topics             = optional(set(string), [])<br>    homepage_url       = optional(string, "")<br>    has_issues         = optional(bool, false)<br>    is_template        = optional(bool, false)<br>    template           = optional(string, null)<br>    archived           = optional(bool, false)<br>    archive_on_destroy = optional(bool, true)<br>    advanced_security  = optional(bool, true)<br>    dependabot         = optional(bool, true)<br>    secret_scanning    = optional(bool, true)<br>    code_scanners      = optional(set(string), [])<br>    codeql_languages   = optional(set(string), ["java"])<br>    reusable_workflows = optional(bool, false)<br>    security_scanners  = optional(set(string), [])<br>    teams_access       = optional(map(string), {})<br>    auto_codeowners    = optional(bool, false)<br>    gitlab_mirror      = optional(string, "") # cloud, onprem or ""<br>    gitlab_url         = optional(string, "") # path<br>  }))</pre> | `{}` | no |
| <a name="input_sonarqube_host_url"></a> [sonarqube\_host\_url](#input\_sonarqube\_host\_url) | n/a | `string` | `"https://sonarqube-qa.prisamedia.com"` | no |
| <a name="input_sonarqube_token"></a> [sonarqube\_token](#input\_sonarqube\_token) | sonarqube-qa.prisamedia.com token (admin permission) | `string` | `""` | no |
| <a name="input_sonarqube_user"></a> [sonarqube\_user](#input\_sonarqube\_user) | sonarqube-qa.prisamedia.com token (admin permission) | `string` | `"admin"` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | n/a | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codeowners"></a> [codeowners](#output\_codeowners) | n/a |
| <a name="output_developers"></a> [developers](#output\_developers) | n/a |
| <a name="output_repositories"></a> [repositories](#output\_repositories) | n/a |
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0, < 2.0.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 5.28.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 5.28.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_docs"></a> [docs](#module\_docs) | ./modules/confluence | n/a |
| <a name="module_gitlab"></a> [gitlab](#module\_gitlab) | ./modules/gitlab | n/a |
| <a name="module_sonarqube"></a> [sonarqube](#module\_sonarqube) | ./modules/sonarqube | n/a |

## Resources

| Name | Type |
|------|------|
| [github_actions_repository_access_level.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_repository_access_level) | resource |
| [github_branch_default.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_branch_protection.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_file.code_scanning](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.codeowners](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.security_testing](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_team.codeowners](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team.developers](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team_membership.codeowners](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_membership) | resource |
| [github_team_membership.developers](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_membership) | resource |
| [github_team_repository.maintain](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_team_repository.push](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_team_repository.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codeowners"></a> [codeowners](#input\_codeowners) | n/a | `set(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `""` | no |
| <a name="input_developers"></a> [developers](#input\_developers) | n/a | `set(string)` | `[]` | no |
| <a name="input_github_mirror_auth"></a> [github\_mirror\_auth](#input\_github\_mirror\_auth) | github.com username:token | `string` | `""` | no |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | n/a | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | `""` | no |
| <a name="input_privacy"></a> [privacy](#input\_privacy) | n/a | `string` | `"closed"` | no |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | n/a | <pre>map(object({<br>    description        = optional(string, "")<br>    default_branch     = optional(string, "")<br>    protected_branches = optional(set(string), [])<br>    visibility         = optional(string, "private")<br>    topics             = optional(set(string), [])<br>    homepage_url       = optional(string, "")<br>    has_issues         = optional(bool, false)<br>    is_template        = optional(bool, false)<br>    template           = optional(string, null)<br>    archived           = optional(bool, false)<br>    archive_on_destroy = optional(bool, true)<br>    advanced_security  = optional(bool, true)<br>    dependabot         = optional(bool, true)<br>    secret_scanning    = optional(bool, true)<br>    code_scanners      = optional(set(string), [])<br>    codeql_languages   = optional(set(string), ["java"])<br>    reusable_workflows = optional(bool, false)<br>    security_scanners  = optional(set(string), [])<br>    teams_access       = optional(map(string), {})<br>    auto_codeowners    = optional(bool, false)<br>    gitlab_mirror      = optional(string, "") # cloud, onprem or ""<br>    gitlab_url         = optional(string, "") # path<br>  }))</pre> | `{}` | no |
| <a name="input_sonarqube_host_url"></a> [sonarqube\_host\_url](#input\_sonarqube\_host\_url) | n/a | `string` | `""` | no |
| <a name="input_sonarqube_token"></a> [sonarqube\_token](#input\_sonarqube\_token) | n/a | `string` | `""` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | n/a | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codeowners"></a> [codeowners](#output\_codeowners) | n/a |
| <a name="output_developers"></a> [developers](#output\_developers) | n/a |
| <a name="output_repositories"></a> [repositories](#output\_repositories) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
