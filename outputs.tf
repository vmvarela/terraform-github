output "repositories" {
  value = github_repository.repo
}

output "codeowners" {
  value = try(github_team.codeowners, {})
}

output "developers" {
  value = try(github_team.developers, {})
}