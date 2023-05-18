provider "gitlab" {
  alias    = "cloud"
  base_url = "https://gitlab.com"
  token    = var.gitlab_cloud_token
}

provider "gitlab" {
  alias    = "onprem"
  base_url = var.gitlab_onprem_url
  token    = var.gitlab_onprem_token
}

variable "gitlab_cloud_token" {
  type        = string
  description = "gitlab.com token"
  default     = ""
}

variable "gitlab_onprem_url" {
  type        = string
  description = "gitlab (on-prem) base url"
  default     = ""
}

variable "gitlab_onprem_token" {
  type        = string
  description = "gitlab (on-prem) token"
  default     = ""
}

# username:token to push into github from gitlab
variable "github_mirror_auth" {
  type        = string
  description = "github.com username:token"
  default     = ""
}

# gitlab.com mirror
resource "gitlab_project_mirror" "gitlab" {
  provider                = gitlab.cloud
  for_each                = local.gitlab_cloud_mirrors
  project                 = each.value
  url                     = "https://${var.github_mirror_auth}@github.com/${var.github_owner}/${each.key}.git"
  only_protected_branches = false
  keep_divergent_refs     = false
  enabled                 = true
}

data "gitlab_project" "gitlab_cloud" {
  provider            = gitlab.cloud
  for_each            = local.gitlab_cloud_mirrors
  path_with_namespace = each.value
}

data "gitlab_project_protected_branches" "gitlab_cloud" {
  provider   = gitlab.cloud
  for_each   = local.gitlab_cloud_mirrors
  project_id = each.value
}

# gitlab.prisamedia.com mirror
resource "gitlab_project_mirror" "gitlab_onprem" {
  provider                = gitlab.onprem
  for_each                = local.gitlab_onprem_mirrors
  project                 = each.value
  url                     = "https://${var.github_mirror_auth}@github.com/${var.github_owner}/${each.key}.git"
  only_protected_branches = false
  keep_divergent_refs     = false
  enabled                 = true
}


data "gitlab_project" "gitlab_onprem" {
  provider            = gitlab.onprem
  for_each            = local.gitlab_onprem_mirrors
  path_with_namespace = each.value
}

data "gitlab_project_protected_branches" "gitlab_onprem" {
  provider   = gitlab.onprem
  for_each   = local.gitlab_onprem_mirrors
  project_id = each.value
}

locals {
  gitlab_cloud_mirrors  = { for k, i in local.repositories : k => i.gitlab_url if i.gitlab_mirror == "cloud" }
  gitlab_onprem_mirrors = { for k, i in local.repositories : k => i.gitlab_url if i.gitlab_mirror == "onprem" }
}