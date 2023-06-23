terraform {
  required_version = ">= 1.3.0, < 2.0.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.28.0"
    }
    sonarqube = {
      source = "jdamata/sonarqube"
    }
    gitlab = {
      source = "gitlabhq/gitlab"
      configuration_aliases = [
        gitlab.cloud,
        gitlab.onprem,
      ]
    }
  }
}

module "docs" {
  source         = "./modules/confluence"
  doc_repository = "devops-docs"
  github_owner   = var.github_owner
  name           = var.name
  team           = local.developers_name
  repositories   = local.repositories
  codeowners     = var.codeowners
  developers     = var.developers
}

module "gitlab" {
  source             = "./modules/gitlab"
  github_owner       = var.github_owner
  github_mirror_auth = var.github_mirror_auth
  repositories       = local.repositories

  providers = {
    gitlab.onprem = gitlab.onprem
    gitlab.cloud  = gitlab.cloud
  }
}

module "sonarqube" {
  source          = "./modules/sonarqube"
  repositories    = local.repositories
  name            = var.name
  description     = var.description
  github_owner    = var.github_owner
  developers_name = local.developers_name
  codeowners_name = local.codeowners_name
}

