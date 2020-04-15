resource "aws_autoscaling_group" "autoscaling_group" {
  name                 = var.name
  name_prefix          = var.name_prefix
  max_size             = var.max_size
  min_size             = var.min_size
  default_cooldown     = var.default_cooldown
  launch_configuration = var.launch_configuration

  dynamic "launch_template" {
    for_each = var.launch_template
    content {
      id      = lookup(launch_template.value, "id", null)
      name    = lookup(launch_template.value, "name", null)
      version = lookup(launch_template.value, "version", null)
    }
  }

  dynamic "mixed_instances_policy" {
    for_each = var.mixed_instances_policy
    content {
      dynamic "instances_distribution" {
        for_each = lookup(mixed_instances_policy.value, "instances_distribution", []) == [] ? [] : [lookup(mixed_instances_policy.value, "instances_distribution", [])] 
        content {
          on_demand_allocation_strategy            = lookup(instances_distribution.value, "on_demand_allocation_strategy", null)
          on_demand_base_capacity                  = lookup(instances_distribution.value, "on_demand_base_capacity", null)
          on_demand_percentage_above_base_capacity = lookup(instances_distribution.value, "on_demand_percentage_above_base_capacity", null)
          spot_allocation_strategy                 = lookup(instances_distribution.value, "spot_allocation_strategy", null)
          spot_instance_pools                      = lookup(instances_distribution.value, "spot_instance_pools", null)
          spot_max_price                           = lookup(instances_distribution.value, "spot_max_price", null)
        }
      }

      dynamic "launch_template" {
        for_each = lookup(mixed_instances_policy.value, "launch_template", []) == [] ? [] : [lookup(mixed_instances_policy.value, "launch_template", [])]
        content {
          dynamic "launch_template_specification" {
            for_each = lookup(launch_template.value, "launch_template_specification", []) == [] ? [] : [lookup(launch_template.value, "launch_template_specification", [])]
            content {
              launch_template_id   = lookup(launch_template_specification.value, "launch_template_id", null)
              launch_template_name = lookup(launch_template_specification.value, "launch_template_name", null)
              version              = lookup(launch_template_specification.value, "version", null)
            }
          }

          dynamic "override" {
            for_each = lookup(launch_template.value, "override", [])
            content {
              instance_type     = lookup(override.value, "instance_type", null)
              weighted_capacity = lookup(override.value, "weighted_capacity", null)
            }
          }
        }
      }
    }
  }

  dynamic "initial_lifecycle_hook" {
    for_each = var.initial_lifecycle_hook
    content {
      default_result          = lookup(initial_lifecycle_hook.value, "default_result", null)
      heartbeat_timeout       = lookup(initial_lifecycle_hook.value, "heartbeat_timeout", null)
      lifecycle_transition    = initial_lifecycle_hook.value.lifecycle_transition
      name                    = initial_lifecycle_hook.value.name
      notification_metadata   = lookup(initial_lifecycle_hook.value, "notification_metadata", null)
      notification_target_arn = lookup(initial_lifecycle_hook.value, "notification_target_arn", null)
      role_arn                = lookup(initial_lifecycle_hook.value, "role_arn", null)
    }
  }

  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  load_balancers            = var.load_balancers
  vpc_zone_identifier       = var.vpc_zone_identifier
  target_group_arns         = var.target_group_arns
  termination_policies      = var.termination_policies
  suspended_processes       = var.suspended_processes
  metrics_granularity       = var.metrics_granularity
  enabled_metrics           = var.enabled_metrics

  dynamic "tag" {
    for_each = var.tag
    content {
      key                 = tag.key
      propagate_at_launch = true
      value               = tag.value
    }
  }

  tags                  = var.tags
  placement_group       = var.placement_group
  max_instance_lifetime = var.max_instance_lifetime

  lifecycle {
    create_before_destroy = true
  }
}