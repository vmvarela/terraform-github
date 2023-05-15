terraform {
  required_version = ">= 1.3.0, < 2.0.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.25.0"
    }
    sonarqube = {
      source  = "jdamata/sonarqube"
      version = "0.15.13"
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