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
```