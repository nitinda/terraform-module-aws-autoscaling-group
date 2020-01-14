resource "aws_autoscaling_group" "autoscaling_group" {
  name_prefix               = var.name_prefix
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  vpc_zone_identifier       = var.vpc_zone_identifier
  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_check_grace_period
  default_cooldown          = var.default_cooldown
  force_delete              = var.force_delete
  suspended_processes       = var.suspended_processes
  tags                      = [data.null_data_source.null_data_source_asg_tags.*.outputs]
  target_group_arns         = var.target_group_arns
  mixed_instances_policy {
    launch_template {

      dynamic "launch_template_specification" {
        for_each = [var.launch_template_specification]
        content {
          launch_template_id   = lookup(launch_template_specification.value, "launch_template_id", null)
          launch_template_name = lookup(launch_template_specification.value, "launch_template_name", null)
          version              = lookup(launch_template_specification.value, "version", null)
        }
      }

      dynamic "override" {
        for_each = [local.instance_types]
        content {
          instance_type     = lookup(override.value, "instance_type", null)
          weighted_capacity = lookup(override.value, "weighted_capacity", null)
        }
      }
    }

    dynamic "instances_distribution" {
      for_each = [var.instances_distribution]
      content {
        on_demand_allocation_strategy            = lookup(instances_distribution.value, "on_demand_allocation_strategy", null)
        on_demand_base_capacity                  = lookup(instances_distribution.value, "on_demand_base_capacity", null)
        on_demand_percentage_above_base_capacity = lookup(instances_distribution.value, "on_demand_percentage_above_base_capacity", null)
        spot_allocation_strategy                 = lookup(instances_distribution.value, "spot_allocation_strategy", null)
        spot_instance_pools                      = lookup(instances_distribution.value, "spot_instance_pools", null)
        spot_max_price                           = lookup(instances_distribution.value, "spot_max_price", null)
      }
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

