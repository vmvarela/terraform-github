terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
    sonarqube = {
      source = "jdamata/sonarqube"
    }
    gitlab = {
      source = "gitlabhq/gitlab"
    }
  }
}

provider "github" {
  app_auth {
    # `GITHUB_OWNER`
    # `GITHUB_APP_ID`
    # `GITHUB_APP_INSTALLATION_ID` (https://github.com/organizations/PrisaMedia/settings/installations/??????)
    # `GITHUB_APP_PEM_FILE`
  }
}

provider "sonarqube" {
}

provider "gitlab" {
  alias = "cloud"
}

provider "gitlab" {
  alias = "onprem"
}