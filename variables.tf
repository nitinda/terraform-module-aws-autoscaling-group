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
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in."
  type        = "list"
}

variable "target_group_arns" {
  description = "A list of aws_alb_target_group ARNs"
  type        = "list"
}

variable "default_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start."
}

variable "force_delete" {
  description = "Allows deleting the autoscaling group without waiting for all instances in the pool to terminate"
}

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health. Default: 300"
}

variable "suspended_processes" {
  description = "A list of processes to suspend for the AutoScaling Group"
  type        = "list"
}

variable "tags" {
  description = "A list of tag blocks."
  type        = "map"
}

variable "override_instance_types" {
  description = "The size of instance to launch, minimum 2 types must be specified."
  type        = "list"
}

variable "launch_template_specification" {
  description = "Nested argument defines the Launch Template."
  type        = "list"
}

variable "instances_distribution" {
  description = "Nested argument containing settings on how to mix on-demand and Spot instances in the Auto Scaling group."
  type        = "list"
}



## Tags
variable common_tags {
  description = "Resources Tags"
  type        = "map"
}