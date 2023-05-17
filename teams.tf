# developers team
resource "github_team" "developers" {
  name           = var.name
  description    = (var.description == "" ? upper(var.name) : var.description)
  privacy        = var.privacy
  parent_team_id = var.parent_team_id
}

# codeowners team
resource "github_team" "codeowners" {
  name           = join("-", ["codeowner", var.name])
  description    = join(" ", [(var.description == "" ? upper(var.name) : var.description), "(CODEOWNER)"])
  privacy        = var.privacy
  parent_team_id = github_team.developers.id
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

locals {

  # build codeowners team memberships
  _codeowners = [
    for i in var.codeowners : {
      team     = var.name
      role     = "member"
      username = i
    }
  ]
  codeowners_memberships = { for i in local._codeowners : format("%s_%s", i.team, i.username) => i }

  # build developers team memberships
  _members = [
    for i in var.developers : {
      team     = var.name
      role     = "member"
      username = i
    }
  ]
  _maintainers = [
    for i in var.codeowners : {
      team     = var.name
      role     = "maintainer"
      username = i
    }
  ]
  developers_memberships = { for i in concat(local._members, local._maintainers) : format("%s_%s", i.team, i.username) => i }

  repository_access = { for k, i in local.repositories : format("%s_%s", var.name, k) => {
      name = k
      repo = i
  } }

}
