select_github_prisamedia_workspace() {
    export TF_WORKSPACE="Github-Prisamedia-$1"
    ln -sf $1.tfvars prisa-team.auto.tfvars
}

# direnv (autoload .envrc files)
eval "$(direnv hook zsh)"
direnv allow /workspaces/*
