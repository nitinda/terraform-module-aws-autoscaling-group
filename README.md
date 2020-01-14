# Terraform Module Name: terraform-module-aws-autoscaling-group


## General

This module may be used to create **_EC2 AutoScalling Group_** resources in AWS cloud provider..

---


## Prerequisites

This module needs **_Terraform 0.11.14_** or newer.
You can download the latest Terraform version from [here](https://www.terraform.io/downloads.html).

This module deploys aws services details are in respective feature branches.

---

## Features Branches

Below we are able to check the resources that are being created as part of this module call:

* **_EC2 AutoScalling Group_**


---

## Usage

## Using this repo

To use this module, add the following call to your code:

```tf
module "autoscaling_group" {
  source = "git::https://github.com/nitinda/terraform-module-aws-autoscaling-group.git?ref=terraform-11/master"

  providers = {
    "aws" = "aws.services"
  }

  name_prefix               = "aws-autoscaling-group-"
  desired_capacity          = "${var.asg_desired_capacity}"
  common_tags               = "${var.common_tags}"
  max_size                  = "${var.asg_max_size}"
  min_size                  = "${var.asg_min_size}"
  default_cooldown          = "${var.asg_default_cooldown}"
  force_delete              = "${var.asg_force_delete}"
  health_check_type         = "${var.asg_health_check_type}"
  vpc_zone_identifier       = ["${var.asg_subnet_ids}"]
  target_group_arns         = ["${var.target_group_arns}"]
  health_check_grace_period = "${var.asg_health_check_grace_period}"
  suspended_processes       = "${var.asg_uspended_processes}"
  override_instance_types   = "${var.asg_override_instance_types}"
  launch_template_specification = [
    {
      launch_template_id = "${var.launch_template_id}"
      version            = "$$Latest"
    }
  ]
  instances_distribution    = "${var.asg_instances_distribution}"
  tags                      = "${merge(var.common_tags, map(
    "Name", "aws-autoscaling-group-ec2-worker-nodes"
  ))}"
}
```

---

## Inputs

The variables required in order for the module to be successfully called from the deployment repository are the following:



|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|-----:|
| **_name\_prefix_** | Creates a unique name | _string_ |
| desired_capacity | The number of Amazon EC2 instances | _string_ |
| max_size | The maximum size | _string_ |
| min_size | The minimum size | _string_ |
| default_cooldown | The amount of time, in seconds | _string_ |
| health_check_type | Type of health check | string          |
| force_delete | Allows deleting the autoscaling group | _string_ |
| vpc_zone_identifier | A list of subnet IDs to launch resources | _list_ |
| target_group_arns | A list of aws_alb_target_group ARNs | _list_ |
| health_check_grace_period | Time (in seconds) after instance comes | _string_ |
| suspended_processes | A list of processes to suspend | _list_ |
| tags | A list of tag blocks | map |
| override_instance_types | The size of instance to launch | _list_ |
| launch_template_specification | Nested argument defines the LC | _list of maps_ |
| instances_distribution | Nested argument containing settings | _list of maps_ |
| common_tags | Common tags | _map_ |



## Outputs

* **_id_**
* **_name_**
* **_arn_**




### Usage
In order for the variables to be accessed on module level please use the syntax below:

```tf
module.<module_name>.<output_variable_name>
```

If an output variable needs to be exposed on root level in order to be accessed through terraform state file follow the steps below:

- Include the syntax above in the network layer output terraform file.
- Add the code snippet below to the variables/global_variables file.

```tf
data "terraform_remote_state" "<module_name>" {
  backend = "s3"

  config {
    bucket = <bucket_name> (i.e. "s3-webstack-terraform-state")
    key    = <state_file_relative_path> (i.e. "env:/${terraform.workspace}/4_Networking/terraform.tfstate")
    region = <bucket_region> (i.e. "eu-central-1")
  }
}
```

- The output variable is able to be accessed through terraform state file using the syntax below:

```tf
"${data.terraform_remote_state.<module_name>.<output_variable_name>}"
```

## Authors
Module maintained by Module maintained by the - **_Nitin Das_**
