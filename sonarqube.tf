provider "sonarqube" {
  host  = var.sonarqube_host_url
  token = var.sonarqube_token
}

# sonarqube-qa.prisamedia.com token (admin permission)
variable "sonarqube_token" {
  type    = string
  default = ""
}

# sonarqube-qa.prisamedia.com token (admin permission)
variable "sonarqube_user" {
  type    = string
  default = "admin"
}

variable "sonarqube_host_url" {
  type    = string
  default = "https://sonarqube-qa.prisamedia.com"
}

# a project for every repository
resource "sonarqube_project" "repo" {
  for_each   = local.sonar_projects
  name       = each.key
  project    = each.key
  tags       = each.value.topics
  visibility = "private"
  depends_on = [github_repository.repo]
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
  name        = format("%s/%s", var.github_owner, var.name)
  description = (var.description == "" ? upper(var.name) : var.description)
}

# codeowners team
resource "sonarqube_group" "codeowners" {
  count       = length(local.sonar_projects) > 0 ? 1 : 0
  name        = format("%s/%s", var.github_owner, join("-", ["codeowner", var.name]))
  description = join(" ", [(var.description == "" ? upper(var.name) : var.description), "(CODEOWNER)"])
}

# project access: push (developers)
resource "sonarqube_permissions" "codeviewer" {
  for_each    = { for k, i in local.sonar_projects : format("%s_%s", var.name, k) => k }
  project_key = each.value
  group_name  = format("%s/%s", var.github_owner, github_team.developers.name)
  permissions = ["codeviewer", "scan", "user"]
  depends_on  = [sonarqube_project.repo]
}

# project access: maintain (codeowners)
resource "sonarqube_permissions" "admin" {
  for_each    = { for k, i in local.sonar_projects : format("%s_%s", var.name, k) => k }
  project_key = each.value
  group_name  = format("%s/%s", var.github_owner, github_team.codeowners.name)
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

# token para analizar el proyecto
resource "sonarqube_user_token" "repo" {
  for_each    = local.sonar_projects
  login_name  = var.sonarqube_user
  name        = format("%s-token", each.key)
  type        = "PROJECT_ANALYSIS_TOKEN"
  project_key = each.key
  depends_on  = [sonarqube_project.repo]
}

# secret con el token generado
resource "github_actions_secret" "sonar_token" {
  for_each        = local.sonar_projects
  repository      = each.key
  secret_name     = "SONAR_TOKEN"
  plaintext_value = sonarqube_user_token.repo[each.key].token
  depends_on      = [sonarqube_user_token.repo]
}

# variable con la URL de SonarQube
resource "github_actions_variable" "sonar_host_url" {
  for_each      = local.sonar_projects
  repository    = each.key
  variable_name = "SONAR_HOST_URL"
  value         = var.sonarqube_host_url
  depends_on    = [sonarqube_project.repo]
}

locals {
  sonar_projects = { for k, i in local.repositories : k => i if contains(i.code_scanners, "sonarqube") }

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