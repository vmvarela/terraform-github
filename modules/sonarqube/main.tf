terraform {
  required_providers {
    sonarqube = {
      source  = "jdamata/sonarqube"
      version = ">= 0.16.1"
    }
  }
}

# a project for every repository
resource "sonarqube_project" "repo" {
  for_each   = local.sonar_projects
  name       = each.key
  project    = each.key
  tags       = each.value.topics
  visibility = "private"
}

resource "sonarqube_project_main_branch" "repo" {
  for_each   = local.sonar_projects
  name       = each.value.default_branch
  project    = each.key
  depends_on = [sonarqube_project.repo]
}

# developers team
resource "sonarqube_group" "developers" {
  count       = length(local.sonar_projects) > 0 ? 1 : 0
  name        = format("%s/%s", var.github_owner, var.developers_name)
  description = (var.description == "" ? upper(var.name) : var.description)
}

# codeowners team
resource "sonarqube_group" "codeowners" {
  count       = length(local.sonar_projects) > 0 ? 1 : 0
  name        = format("%s/%s", var.github_owner, var.codeowners_name)
  description = join(" ", [(var.description == "" ? upper(var.name) : var.description), "(CODEOWNER)"])
}

# project access: push (developers)
resource "sonarqube_permissions" "codeviewer" {
  for_each    = { for k, i in local.sonar_projects : format("%s_%s", var.name, k) => k }
  project_key = each.value
  group_name  = format("%s/%s", var.github_owner, var.developers_name)
  permissions = ["codeviewer", "scan", "user"]
  depends_on  = [sonarqube_project.repo]
}

# project access: maintain (codeowners)
resource "sonarqube_permissions" "admin" {
  for_each    = { for k, i in local.sonar_projects : format("%s_%s", var.name, k) => k }
  project_key = each.value
  group_name  = format("%s/%s", var.github_owner, var.codeowners_name)
  permissions = ["admin"]
  depends_on  = [sonarqube_project.repo]
}

# teams access: user (teams_access)
resource "sonarqube_permissions" "teams" {
  for_each    = local.sonar_teams_access
  project_key = each.value.project
  group_name  = format("%s/%s", var.github_owner, each.value.team)
  permissions = ["user"]
  depends_on  = [sonarqube_project.repo]
}

locals {
  sonar_projects = { for k, i in var.repositories : k => i if contains(i.code_scanners, "sonarqube") }

  _sonar_teams_access = flatten([
    for k, v in local.sonar_projects : [
      for t, a in v.teams_access : {
        project = k
        team    = t
      }
    ]
  ])

  sonar_teams_access = { for i in local._sonar_teams_access : format("%s_%s", i.project, i.team) => i }
}
