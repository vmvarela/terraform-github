resource "github_repository_file" "codeowners" {
  for_each            = { for k, i in local.repositories : k => i if i.auto_codeowners }
  repository          = each.key
  branch              = each.value.default_branch
  file                = ".github/CODEOWNERS"
  content             = format("* @%s/%s", var.github_owner, join("-", ["codeowner", var.name]))
  overwrite_on_create = true
}
