name        = "devops-test"
description = "Testing Description"
prefix      = "test"
topics      = ["terratest"]

codeowners = [
  "vmvarela-clb_prisa",  # Victor M. Varela
]

developers = [
  "ebarberan-clb_prisa", # Enrique Barberan
]

repositories = {
  "repo-test" = {
    description        = "repotest"
    topics             = ["test"]
    archive_on_destroy = false
    
  }

}
