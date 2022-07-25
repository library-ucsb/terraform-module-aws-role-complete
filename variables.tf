variable "github_owner" {
    type                            = string
    default                         = "library-ucsb"
}

variable "role_name" {
    type                            = string
}

variable "aws_region" {
    type                            = string
    default                         = "us-west-2"  
}

variable "policy_relative_directory" {
    type                            = string
    default                         = "./"
}