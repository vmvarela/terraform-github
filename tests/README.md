# Terratest en GO

Pruebas ejecutadas en GO

Descarga GO en:
https://dl.google.com/go/go1.20.5.linux-amd64.tar.gz

## Montage
En la carpeta tests se encuentra el terraform a testear y el .go

En el main.tf, llama a la referencia real en este repo, que es la carpeta raiz ("tests/main.tf" llama a "./main.tf" )

De esta manera se utiliza el modulo creado para terraform (ultima version subida a "https://app.terraform.io/app/PRISA/registry/private/modules")

Puntos importantes del archivo main_test.go
## Nombre(s) del archivo
Es importante que el final del archivo acabe en *_test.go

De esta manera puedes tener distintos tests con distinto nombre e independientes unos de otros

## Variable terraformOptions en TestTerraformBasicExample
```
terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
    // website::tag::1::Set the path to the Terraform code that will be tested.
    // The path to where our Terraform code is located
    TerraformDir: "./.",
    // Variables to pass to our Terraform code using -var options
    Vars: map[string]interface{}{
        "example": expectedText,
        // We also can see how lists and maps translate between terratest and terraform.
        "example_list": expectedList,
        "example_map":  expectedMap,
    },
    // Variables to pass to our Terraform code using -var-file options
    VarFiles: []string{"varfile.tfvars"},
    // Disable colors in Terraform commands so its easier to parse stdout/stderr
    NoColor: false,
})
```
Contiene la configuracion de las pruebas del terraform.

La ruta donde lanzar el terraform init, plan, apply y destroy se configura con la opcion "TerraformDir"

La opcion "Vars" convierte las variables que describas a variables "terraform". Actuan como las variables que escribieras en un .tf

La opcion "VarFiles" contiene los archivos .tfvars que se quieren incluir en la prueba.

## Comprobacion mediante outputs de terraform
La prueba recupera las respuestas de los outputs y las compara con asserts contra valores literales escritos en variables en GO.

## Ejecucion de las pruebas (comandos)
```
go mod init github.com/PrisaMedia/devops-terraform-github
go tidy
go test
```<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_github"></a> [github](#module\_github) | ../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codeowners"></a> [codeowners](#input\_codeowners) | n/a | `set(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `""` | no |
| <a name="input_developers"></a> [developers](#input\_developers) | n/a | `set(string)` | `[]` | no |
| <a name="input_github_mirror_auth"></a> [github\_mirror\_auth](#input\_github\_mirror\_auth) | github.com username:token | `string` | `""` | no |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | n/a | `string` | `"PrisaMedia"` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | github.com token (owner) | `string` | `""` | no |
| <a name="input_gitlab_cloud_token"></a> [gitlab\_cloud\_token](#input\_gitlab\_cloud\_token) | gitlab.com token | `string` | `""` | no |
| <a name="input_gitlab_onprem_token"></a> [gitlab\_onprem\_token](#input\_gitlab\_onprem\_token) | gitlab (on-prem) token | `string` | `""` | no |
| <a name="input_gitlab_onprem_url"></a> [gitlab\_onprem\_url](#input\_gitlab\_onprem\_url) | gitlab (on-prem) base url | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | `""` | no |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | n/a | <pre>map(object({<br>    description        = optional(string, "")<br>    default_branch     = optional(string, "")<br>    protected_branches = optional(set(string), [])<br>    visibility         = optional(string, "private")<br>    topics             = optional(set(string), [])<br>    homepage_url       = optional(string, "")<br>    has_issues         = optional(bool, false)<br>    is_template        = optional(bool, false)<br>    template           = optional(string, null)<br>    archived           = optional(bool, false)<br>    archive_on_destroy = optional(bool, true)<br>    advanced_security  = optional(bool, false)<br>    dependabot         = optional(bool, true)<br>    secret_scanning    = optional(bool, true)<br>    reusable_workflows = optional(bool, false)<br>    teams_access       = optional(map(string), {})<br>    code_scanners      = optional(set(string), [])<br>    codeql_languages   = optional(set(string), ["java"])<br>    security_scanners  = optional(set(string), [])<br>    auto_codeowners    = optional(bool, false)<br>    gitlab_mirror      = optional(string, "") # cloud, onprem or ""<br>    gitlab_url         = optional(string, "") # path<br>  }))</pre> | `{}` | no |
| <a name="input_sonarqube_token"></a> [sonarqube\_token](#input\_sonarqube\_token) | sonarqube-qa.prisamedia.com token (admin permission) | `string` | `""` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | n/a | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codeowners"></a> [codeowners](#output\_codeowners) | n/a |
| <a name="output_developers"></a> [developers](#output\_developers) | n/a |
| <a name="output_repositories"></a> [repositories](#output\_repositories) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
