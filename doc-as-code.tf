# md en carpeta docs/teams con el correspondiente equipo
resource "github_repository_file" "team_md" {
  repository          = "devops-docs"
  branch              = "main"
  file                = format("docs/teams/team-%s.md", var.name)
  overwrite_on_create = true
  content = templatefile("${path.module}/templates/team.mdtpl", {
    team         = var.name,
    prefix       = var.prefix,
    repositories = var.repositories,
    codeowners   = var.codeowners,
    developers   = var.developers,
  })
}