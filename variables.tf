## Auto Scalling Group
variable "name" {
  description = "The name of the auto scaling group"
  default     = null
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
  default     = null
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
}

variable "default_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start."
  type        = number
  default     = 60
}

variable "launch_configuration" {
  description = "The name of the launch configuration to use"
  default     = null
}

variable "launch_template" {
  description = "Nested argument with Launch template specification to use to launch instances."
  type        = any
  default     = {}
}

variable "mixed_instances_policy" {
  description = "Configuration block containing settings to define launch targets for Auto Scaling groups"
  default     = []
  type        = any
}

variable "initial_lifecycle_hook" {
  description = "One or more Lifecycle Hooks to attach to the autoscaling group before instances are launched"
  default     = []
  type        = any
}

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health. Default: 300"
  default     = 300
  type        = number
}

variable "health_check_type" {
  description = "EC2 or ELB"
  default     = "EC2"
}

variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group."
  default     = 0
  type        = number
}

variable "force_delete" {
  description = "Allows deleting the autoscaling group without waiting for all instances in the pool to terminate"
  default     = true
  type        = bool
}

variable "load_balancers" {
  description = "A list of elastic load balancer names to add to the autoscaling group names"
  type        = list(string)
  default     = []
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(string)
  default     = []
}

variable "target_group_arns" {
  description = "A list of aws_alb_target_group ARNs"
  type        = list(string)
  default     = []
}

variable "termination_policies" {
  description = "A list of policies to decide how the instances in the auto scale group should be terminated"
  default     = []
  type        = list(string)
}

variable "suspended_processes" {
  description = "A list of processes to suspend for the AutoScaling Group"
  type        = list(string)
  default     = []
}

variable "tag" {
  description = "A list of tag blocks"
  default     = []
  type        = any
}

variable "tags" {
  description = "A list of tag blocks (maps)"
  type        = list(map(string))
  default     = []
}

variable "placement_group" {
  description = "The name of the placement group into which you'll launch your instances, if any"
  default     = null
}

variable "metrics_granularity" {
  description = "The granularity to associate with the metrics to collect"
  default     = "1Minute"
}

variable "enabled_metrics" {
  description = "A list of metrics to collect"
  default     = []
  type        = list(string)
}

variable "max_instance_lifetime" {
  description = "The maximum amount of time, in seconds, that an instance can be in service, values must be either equal to 0 or between 604800 and 31536000 seconds"
  default     = null
}
