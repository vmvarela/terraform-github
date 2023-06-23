resource "github_repository_file" "code_scanning" {
  for_each            = { for k, i in local.repositories : k => i if length(i.code_scanners) > 0 }
  repository          = each.key
  branch              = each.value.default_branch
  file                = ".github/workflows/code-scanning.yml"
  overwrite_on_create = true
  content = templatefile("${path.module}/templates/code-scanning.ymltpl", {
    repository         = each.key,
    code_scanners      = each.value.code_scanners,
    protected_branches = length(each.value.protected_branches) > 0 ? each.value.protected_branches : [each.value.default_branch],
    codeql_languages   = each.value.codeql_languages
  })
}

resource "github_repository_file" "security_testing" {
  for_each            = { for k, i in local.repositories : k => i if length(i.security_scanners) > 0 }
  repository          = each.key
  branch              = each.value.default_branch
  file                = ".github/workflows/security-testing.yml"
  overwrite_on_create = true
  content = templatefile("${path.module}/templates/security-testing.ymltpl", {
    security_scanners = each.value.security_scanners,
    url               = each.value.homepage_url
  })
}

