resource "aws_autoscaling_group" "this" {
  availability_zones = var.availability_zones
  desired_capacity   = var.asg_desired_capacity
  max_size           = var.asg_max_size
  min_size           = var.asg_min_size
  # vpc_zone_identifier = ["subnet-0b233b0712175c05b", "subnet-084624256b1d16f7e", "subnet-0ff1ba06099209445"]
  # vpc_zone_identifier = var.vpc_zone_identifier

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }
}