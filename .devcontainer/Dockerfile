FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

RUN apt update -y && apt install -y direnv pre-commit gnupg software-properties-common && apt clean
RUN sed -i 's/bash/zsh/' /etc/passwd

# Terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg ; \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
        https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
        tee /etc/apt/sources.list.d/hashicorp.list ; \
    apt update -y && apt install terraform && apt clean

# terraform-docs
RUN curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-$(uname)-amd64.tar.gz ; \
    tar -xzf terraform-docs.tar.gz ; \
    chmod +x terraform-docs ; \
    mv terraform-docs /usr/local/bin/terraform-docs ; \
    rm terraform-docs.tar.gz

# tflint
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

# tfsec
RUN curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash

# OPA
ADD --chmod=755 https://www.openpolicyagent.org/downloads/latest/opa_linux_amd64_static /usr/local/bin/opa

# GO
RUN curl -L -o - https://go.dev/dl/go1.20.5.linux-amd64.tar.gz | tar -C /usr/local -xzf -
ENV PATH=$PATH:/usr/local/go/bin

# PRISA settings
COPY prisamedia.sh /home/vscode/prisamedia.sh
RUN echo "source ~/prisamedia.sh" >> /home/vscode/.zshrc

