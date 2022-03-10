include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../../module_sg"
}

inputs = {
    security_group_name = "ec2_sg"
    vpc_id = "vpc-0f5c8373a8b7cd1f4"

    security_group_rules       = {
        rule01 = {
            description = "HTTP allow ingress"
            direction   = "ingress"
            protocol    = "tcp"
            from_port   = 80
            to_port     = 80
            addresses   = {
            type        = "cidr_blocks"
            cidr_blocks = ["0.0.0.0/0"]
            }
        },
        rule02 = {
            description = "HTTP allow egress"
            direction   = "egress"
            protocol    = "-1"
            from_port   = 0
            to_port     = 0
            addresses   = {
            type        = "cidr_blocks"
            cidr_blocks = ["0.0.0.0/0"]
            }
        }
    }
}