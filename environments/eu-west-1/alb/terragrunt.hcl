include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../module_alb"
}

dependency "security_group_id" {
  config_path = "../security_group/alb_sg/"
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    security_group_id = "security_group_id"
  }
}

dependency "certificate_arn" {
  config_path = "../acm_certificate/"
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    certificate_arn = "certificate_arn"
  }
}


inputs = {
    name = "mhorejsek-alb"
    security_groups = [ dependency.security_group_id.outputs.security_group_id ]
    subnets = [
        "subnet-0b233b0712175c05b",
        "subnet-084624256b1d16f7e",
        "subnet-0ff1ba06099209445"
    ]
    certificate_arn = dependency.certificate_arn.outputs.certificate_arn
}