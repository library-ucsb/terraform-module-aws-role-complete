github_owner                    = "library-ucsb"

# This will be used throughout the module.  terraform-module-MODULE_NAME
role_name                       = "aws-role-complete"

terraform_s3_backend = {
  namespace                     = "ucsb-library"
  environment                   = "iac-tf-module"
  stage                         = "aws-role-complete"
  name                          = "terraform"
  attributes                    = [ "state" ]
}