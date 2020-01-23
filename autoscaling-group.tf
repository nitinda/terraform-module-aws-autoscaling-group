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
  target_group_arns         = var.target_group_arns
  load_balancers            = var.load_balancers

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  dynamic "launch_template" {
    for_each = length(keys(var.launch_template)) == 0 ? [] : [var.launch_template]
    content {
      id      = lookup(launch_template.value, "id", null)
      name    = lookup(launch_template.value, "name", null)
      version = lookup(launch_template.value, "version", null)
    }
  }

  dynamic "network_interfaces" {
    for_each = length(var.network_interfaces) == 0 ? [] : var.network_interfaces
    content {
      associate_public_ip_address = lookup(network_interfaces.value, "associate_public_ip_address", null)
      delete_on_termination       = lookup(network_interfaces.value, "delete_on_termination", true)
      description                 = lookup(network_interfaces.value, "description", null)
      device_index                = lookup(network_interfaces.value, "device_index", null)
      ipv6_addresses              = lookup(network_interfaces.value, "ipv6_addresses", null)
      network_interface_id        = lookup(network_interfaces.value, "network_interface_id", null)
      private_ip_address          = lookup(network_interfaces.value, "private_ip_address", null)
      security_groups             = lookup(network_interfaces.value, "security_groups", null)
      subnet_id                   = lookup(network_interfaces.value, "subnet_id", null)
    }
  }

  dynamic "mixed_instances_policy" {
    for_each = var.mixed_instances_policy == {} ? [] : [var.mixed_instances_policy]
    content {
      dynamic "instances_distribution" {
        for_each = length(keys(lookup(mixed_instances_policy.value, "instances_distribution", {}))) == 0 ? [] : [lookup(mixed_instances_policy.value, "instances_distribution", {})]
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
        for_each = length(keys(lookup(mixed_instances_policy.value, "launch_template", {}))) == 0 ? [] : [lookup(mixed_instances_policy.value, "launch_template", {})]
        content {
          dynamic "launch_template_specification" {
            for_each = length(keys(lookup(launch_template.value, "launch_template_specification", {}))) == 0 ? [] : [lookup(launch_template.value, "launch_template_specification", {})]
            content {
              launch_template_id   = lookup(launch_template_specification.value, "launch_template_id", null)
              launch_template_name = lookup(launch_template_specification.value, "launch_template_name", null)
              version              = lookup(launch_template_specification.value, "version", null)
            }
          }

          dynamic "override" {
            for_each = length(lookup(launch_template.value, "override", [])) == 0 ? [] : lookup(launch_template.value, "override", [])
            content {
              instance_type     = lookup(override.value, "instance_type", null)
              weighted_capacity = lookup(override.value, "weighted_capacity", null)
            }
          }
        }
      }
    }
  }

  lifecycle {
    create_before_destroy = true
  }

}

