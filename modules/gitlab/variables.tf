variable "github_owner" {
  type    = string
  default = ""
}

variable "github_mirror_auth" {
  type        = string
  description = "github.com username:token"
  default     = ""
}

variable "repositories" {
  type = map(object({
    description        = optional(string, "")
    default_branch     = optional(string, "")
    protected_branches = optional(set(string), [])
    visibility         = optional(string, "private")
    topics             = optional(set(string), [])
    homepage_url       = optional(string, "")
    has_issues         = optional(bool, false)
    is_template        = optional(bool, false)
    template           = optional(string, null)
    archived           = optional(bool, false)
    archive_on_destroy = optional(bool, true)
    advanced_security  = optional(bool, true)
    dependabot         = optional(bool, true)
    secret_scanning    = optional(bool, true)
    code_scanners      = optional(set(string), [])
    codeql_languages   = optional(set(string), ["java"])
    reusable_workflows = optional(bool, false)
    security_scanners  = optional(set(string), [])
    teams_access       = optional(map(string), {})
    auto_codeowners    = optional(bool, false)
    gitlab_mirror      = optional(string, "") # cloud, onprem or ""
    gitlab_url         = optional(string, "") # path
  }))
  default = {}

}
