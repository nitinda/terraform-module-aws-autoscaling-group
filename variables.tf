## Auto Scalling Group
variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix."
}

variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group."
}

variable "max_size" {
  description = "The maximum size of the auto scale group."
}

variable "min_size" {
  description = "The minimum size of the auto scale group."
}

variable "health_check_type" {
  description = "EC2 or ELB"
  default     = "EC2"
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(string)
}

variable "target_group_arns" {
  description = "A list of aws_alb_target_group ARNs"
  type        = list(string)
  default     = []
}

variable "load_balancers" {
  description = "A list of elastic load balancer names to add to the autoscaling group names"
  type        = list(string)
  default     = []
}


variable "default_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start."
  default     = 60
}

variable "force_delete" {
  description = "Allows deleting the autoscaling group without waiting for all instances in the pool to terminate"
  default     = true
}

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health. Default: 300"
  default     = 300
}

variable "suspended_processes" {
  description = "A list of processes to suspend for the AutoScaling Group"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A list of tag blocks."
  type        = map(string)
}

variable "mixed_instances_policy" {
  description = "Configuration block containing settings to define launch targets for Auto Scaling groups"
  default     = {}
  type        = any
}

# variable "override_instance_types" {
#   description = "The size of instance to launch, minimum 2 types must be specified."
#   type        = list(string)
# }
# variable "launch_template_specification" {
#   description = "Nested argument defines the Launch Template."
#   type        = list(string)
# }
# variable "instances_distribution" {
#   description = "Nested argument containing settings on how to mix on-demand and Spot instances in the Auto Scaling group."
#   type        = list(string)
# }
