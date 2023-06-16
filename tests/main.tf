terraform {
  required_version = ">= 1.3.0, < 2.0.0"

  cloud {
    organization = "PRISA"
    workspaces {
      name = "Github-Prisamedia-Team-Terratest"
    }
  }
}

module "github" {
  #source              = "app.terraform.io/PRISA/github/terraform"
  #version             = "0.3.1"
  source              = "../"
  github_token        = var.github_token
  github_owner        = var.github_owner
  github_mirror_auth  = var.github_mirror_auth
  sonarqube_token     = var.sonarqube_token
  name                = var.name
  description         = var.description
  prefix              = var.prefix
  topics              = var.topics
  codeowners          = var.codeowners
  developers          = var.developers
  repositories        = var.repositories
  gitlab_cloud_token  = var.gitlab_cloud_token
  gitlab_onprem_token = var.gitlab_onprem_token
  gitlab_onprem_url   = var.gitlab_onprem_url
}

# github.com token (owner)
variable "github_token" {
  type    = string
  default = ""
}

# sonarqube-qa.prisamedia.com token (admin permission)
variable "sonarqube_token" {
  type    = string
  default = ""
}

variable "github_owner" {
  type    = string
  default = "PrisaMedia"
}

variable "name" {
  description = ""
  type        = string
}

variable "prefix" {
  type    = string
  default = ""
}

variable "topics" {
  type    = set(string)
  default = []
}

variable "description" {
  type    = string
  default = ""
}

variable "codeowners" {
  type    = set(string)
  default = []
}

variable "developers" {
  type    = set(string)
  default = []
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
    advanced_security  = optional(bool, false)
    dependabot         = optional(bool, true)
    secret_scanning    = optional(bool, true)
    reusable_workflows = optional(bool, false)
    teams_access       = optional(map(string), {})
    code_scanners      = optional(set(string), [])
    codeql_languages   = optional(set(string), ["java"])
    security_scanners  = optional(set(string), [])
    auto_codeowners    = optional(bool, false)
    gitlab_mirror      = optional(string, "") # cloud, onprem or ""
    gitlab_url         = optional(string, "") # path
  }))
  default = {}
}


variable "gitlab_cloud_token" {
  type        = string
  description = "gitlab.com token"
  default     = ""
}

variable "gitlab_onprem_url" {
  type        = string
  description = "gitlab (on-prem) base url"
  default     = ""
}

variable "gitlab_onprem_token" {
  type        = string
  description = "gitlab (on-prem) token"
  default     = ""
}

# username:token to push into github from gitlab
variable "github_mirror_auth" {
  type        = string
  description = "github.com username:token"
  default     = ""
}
