terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">= 15.11.0"
      configuration_aliases = [
        gitlab.cloud,
        gitlab.onprem,
      ]
    }
  }
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
  gitlab_cloud_mirrors  = { for k, i in var.repositories : k => i.gitlab_url if i.gitlab_mirror == "cloud" }
  gitlab_onprem_mirrors = { for k, i in var.repositories : k => i.gitlab_url if i.gitlab_mirror == "onprem" }
}