# developers team

resource "github_team" "developers" {
  name           = local.developers_name
  description    = (var.description == "" ? upper(var.name) : var.description)
  privacy        = var.privacy
  parent_team_id = local.parent_name
}

# codeowners team
resource "github_team" "codeowners" {
  name           = local.codeowners_name
  description    = join(" ", [(var.description == "" ? upper(var.name) : var.description), "(CODEOWNERS)"])
  privacy        = var.privacy
  parent_team_id = github_team.developers.id
}

# admins team
resource "github_team" "admins" {
  count          = length(local.admins_memberships) > 0 ? 1 : 0
  name           = local.admins_name
  description    = join(" ", [(var.description == "" ? upper(var.name) : var.description), "(ADMINS)"])
  privacy        = var.privacy
  parent_team_id = github_team.codeowners.id
}

# developers members: developers (role = member) + codeowners (role = maintainer)
resource "github_team_membership" "developers" {
  for_each = local.developers_memberships
  team_id  = github_team.developers.id
  username = each.value.username
  role     = each.value.role
}

# codeowners members: codeowners (role = member)
resource "github_team_membership" "codeowners" {
  for_each = local.codeowners_memberships
  team_id  = github_team.codeowners.id
  username = each.value.username
  role     = each.value.role
}

resource "github_team_membership" "admins" {
  for_each = local.admins_memberships
  team_id  = github_team.admins[0].id
  username = each.value.username
  role     = each.value.role
}

# repository access: push (developers)
resource "github_team_repository" "push" {
  for_each   = local.repository_access
  team_id    = github_team.developers.id
  repository = each.value.name
  permission = each.value.repo.gitlab_mirror != "" ? "pull" : "push"
  depends_on = [
    github_repository.repo
  ]
}

# repository access: maintain (codeowners)
resource "github_team_repository" "maintain" {
  for_each   = local.repository_access
  team_id    = github_team.codeowners.id
  repository = each.value.name
  permission = each.value.repo.gitlab_mirror != "" ? "pull" : "maintain"
  depends_on = [
    github_repository.repo
  ]
}

resource "github_team_repository" "admin" {
  for_each   = { for k, i in local.repository_access : k => i if length(local.admins_memberships) > 0 }
  team_id    = github_team.admins[0].id
  repository = each.value.name
  permission = each.value.repo.gitlab_mirror != "" ? "pull" : "admin"
  depends_on = [
    github_repository.repo
  ]
}


locals {

  developers_name = replace(lower(var.name), "/[ //]/", "-")
  codeowners_name = join("-", [local.developers_name, "codeowners"])
  admins_name     = join("-", [local.developers_name, "admins"])
  _parent_name    = replace(lower(dirname(var.name)), "/[ //]/", "-")
  parent_name     = (local._parent_name == "." ? null : local._parent_name)

  # build codeowners team memberships
  _codeowners = [
    for i in var.codeowners : {
      team     = local.codeowners_name
      role     = "member"
      username = i
    }
  ]
  codeowners_memberships = { for i in local._codeowners : format("%s_%s", i.team, i.username) => i }

  # build admins team memberships
  _admins = [
    for i in var.admins : {
      team     = local.admins_name
      role     = "member"
      username = i
    }
  ]
  admins_memberships = { for i in local._admins : format("%s_%s", i.team, i.username) => i }

  # build developers team memberships
  _developers = [
    for i in var.developers : {
      team     = local.developers_name
      role     = "member"
      username = i
    }
  ]
  developers_memberships = { for i in local._developers : format("%s_%s", i.team, i.username) => i }

  repository_access = { for k, i in local.repositories : format("%s_%s", local.developers_name, k) => {
    name = k
    repo = i
  } }

}
