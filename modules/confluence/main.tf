# md en carpeta docs/teams con el correspondiente equipo
terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

resource "github_repository_file" "team_md" {
  repository          = var.doc_repository
  branch              = "main"
  file                = format("docs/teams/team-%s.md", var.name)
  overwrite_on_create = true
  content = templatefile("${path.module}/templates/team.mdtpl", {
    github_owner = var.github_owner
    team         = var.team,
    repositories = var.repositories,
    codeowners   = var.codeowners,
    developers   = var.developers,
  })
}
