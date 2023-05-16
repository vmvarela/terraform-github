# GitHub repository
resource "github_repository" "repo" {
  for_each                                = local.repositories
  name                                    = each.key
  description                             = each.value.description
  visibility                              = each.value.visibility
  homepage_url                            = each.value.homepage_url
  has_issues                              = each.value.has_issues
  has_downloads                           = false
  has_discussions                         = false
  has_projects                            = false
  has_wiki                                = false
  archived                                = each.value.archived
  topics                                  = each.value.topics
  is_template                             = each.value.is_template
  vulnerability_alerts                    = each.value.dependabot
  ignore_vulnerability_alerts_during_read = false # maybe change to true
  archive_on_destroy                      = each.value.archive_on_destroy

  dynamic "template" {
    for_each = each.value.template != null ? [1] : []
    content {
      owner      = var.github_owner
      repository = each.value.template
    }
  }

  security_and_analysis {
    advanced_security {
      status = (each.value.advanced_security == true) ? "enabled" : "disabled"
    }
    secret_scanning {
      status = (each.value.secret_scanning == true) ? "enabled" : "disabled"
    }
    secret_scanning_push_protection {
      status = (each.value.secret_scanning == true) ? "enabled" : "disabled"
    }
  }

  lifecycle {
    ignore_changes = [
      pages,
      template
    ]
  }
}

# GitHub repository default branch
resource "github_branch_default" "repo" {
  for_each   = local.default_branch
  repository = each.key
  branch     = each.value
  depends_on = [github_repository.repo]
}

# GitHub actions repository access level
resource "github_actions_repository_access_level" "repo" {
  for_each     = { for k, v in local.repositories : k => "organization" if v.reusable_workflows == true }
  repository   = each.key
  access_level = each.value
  depends_on   = [github_repository.repo]
}

# GitHub branch protections
resource "github_branch_protection" "repo" {
  for_each      = local.branch_protections
  repository_id = each.value.repository_id
  pattern       = each.value.pattern
  depends_on    = [github_repository.repo]

  required_pull_request_reviews {
    require_code_owner_reviews      = true
    required_approving_review_count = 1
    pull_request_bypassers = [
      format("%s/%s", var.github_owner, github_team.codeowners.slug)
    ]
  }
}

# repository access: other teams
resource "github_team_repository" "repo" {
  for_each   = local.teams_access
  team_id    = each.value.team
  repository = each.value.repository
  permission = each.value.permission
  depends_on = [github_repository.repo]
}

locals {

  _repositories = {
    for k, i in var.repositories :
    replace(lower(var.prefix == "" ? k : format("%s-%s", var.prefix, k)), " ", "-") => i
  }

  _repositories_mirroring = {
    for k, i in local._repositories :
    k => merge(i, {
      "advanced_security"  = false
      "secret_scanning"    = false
      "dependabot"         = false
      "code_scanners"      = []
      "topics"             = ["mirroring"]
      "archive_on_destroy" = false
    })
    if i.gitlab_mirror != ""
  }

  _repositories_not_mirroring = {
    for k, i in local._repositories :
    k => merge(i, {
      "advanced_security"  = (i.visibility == "private" && (i.secret_scanning || i.dependabot || length(i.code_scanners) > 0))
      "archive_on_destroy" = true
    })
    if i.gitlab_mirror == ""
  }

  _repositories_all = merge(local._repositories_not_mirroring, local._repositories_mirroring)

  _repositories_topics = {
    for k, i in local._repositories_all :
    k => merge(i, {
      "topics" = [for topic in(setunion(["terraformed"], i.topics, var.topics)) : replace(lower(topic), " ", "-")]
    })
  }

  repositories = local._repositories_topics

  default_branch = { for k, v in local.repositories : k => v.default_branch if v.default_branch != "" }

  # build branch_protections map from repository.protected_branches
  _branch_protections = flatten([
    for k, v in local.repositories : [
      for b in v.protected_branches : {
        repository_id = k
        pattern       = b
      }
    ]
  ])

  branch_protections = { for i in local._branch_protections : format("%s_%s", i.repository_id, i.pattern) => i }

  # build branch_protections map from repository.protected_branches
  _teams_access = flatten([
    for k, v in local.repositories : [
      for t, a in v.teams_access : {
        repository = k
        team       = t
        permission = (a == "write" ? "push" : "pull")
      }
    ]
  ])

  teams_access = { for i in local._teams_access : format("%s_%s", i.repository, i.team) => i }

}