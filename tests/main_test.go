package test

import (
	//"fmt"

	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
func TestTerraformBasicExample(t *testing.T) {
	t.Parallel()

	codeowners   := []string{"vmvarela-clb_prisa"}
	developers   := []string{"ebarberan-clb_prisa"}
	//repositories := []string{"test-repo-test"}
	//topicsrepo   := []string{"terraformed", "terratest", "test"}

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// website::tag::1::Set the path to the Terraform code that will be tested.
		// The path to where our Terraform code is located
		TerraformDir: "./.",

		// Variables to pass to our Terraform code using -var options
		// Vars: map[string]interface{}{
		// 	"example": expectedText,

		// 	// We also can see how lists and maps translate between terratest and terraform.
		// 	"example_list": expectedList,
		// 	"example_map":  expectedMap,
		// },

		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"varfile.tfvars"},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: false,
	})

	// website::tag::4::Clean up resources with "terraform destroy". Using "defer" runs the command at the end of the test, whether the test succeeds or fails.
	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// website::tag::2::Run "terraform init" and "terraform apply".
	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	outputCodeowners     := terraform.OutputList(t, terraformOptions, "codeowners")
	outputDevelopers     := terraform.OutputList(t, terraformOptions, "developers")
	//outputRepositories   := terraform.OutputList(t, terraformOptions, "repositories")
	//var1 := fmt.Sprintf(outputRepositories[0])

	// website::tag::3::Check the output against expected values.
	// Verify we're getting back the outputs we expect
	// repositories
	//assert.Equal(t, "test-repo-test", outputRepositories[0] )
	// codeowners
	assert.Equal(t, codeowners, outputCodeowners)
	// developers
	assert.Equal(t, developers, outputDevelopers)
	// topics repo
	//assert.Equal(t, topicsrepo, outputRepositories["test-repo-test"].topics)
}