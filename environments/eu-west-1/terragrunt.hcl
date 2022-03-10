remote_state {
    backend = "s3"

    generate = {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }

    config = {
        bucket = "courses-terraform-terragrunt-states-bucket-1q2s3d4r5t"
        key = "eu-west-1/${path_relative_to_include()}/terraform.tfvars"
        region = "eu-west-1"
        encrypt = true
        dynamodb_table = "courses-lock-table"
        profile = "default"
    }
}

terraform {
    extra_arguments "bucket" {
        commands = get_terraform_commands_that_need_vars()
        optional_var_files = [
            find_in_parent_folders("environments.tfvars", "ignore")
        ]
    }
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
        provider "aws" {
            profile = "default"
            region = "eu-west-1"
        }
    EOF
}