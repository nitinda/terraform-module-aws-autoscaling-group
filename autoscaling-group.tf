resource "aws_autoscaling_group" "autoscaling_group" {
    name_prefix               = "${var.name_prefix}"
    max_size                  = "${var.max_size}"
    min_size                  = "${var.min_size}"
    desired_capacity          = "${var.desired_capacity}"
    vpc_zone_identifier       = ["${var.vpc_zone_identifier}"]
    health_check_type         = "${var.health_check_type}"
    health_check_grace_period = "${var.health_check_grace_period}"
    default_cooldown          = "${var.default_cooldown}"
    force_delete              = "${var.force_delete}"
    suspended_processes       = "${var.suspended_processes}"
    tags                      = ["${data.null_data_source.null_data_source_asg_tags.*.outputs}"]
    mixed_instances_policy {
      launch_template {
        launch_template_specification = ["${var.launch_template_specification}"]
        override = ["${local.instance_types}"]
      }
      instances_distribution = ["${var.instances_distribution}"]
    }    
    lifecycle {
      create_before_destroy = true
    }
}