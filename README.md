# _Terraform Module : terraform-module-aws-autoscaling-group_
_Terraform Module for_ **_AWS Autoscaling Group_**

<!--BEGIN STABILITY BANNER-->
---

![_Code : Stable_](https://img.shields.io/badge/Code-Stable-brightgreen?style=for-the-badge&logo=github)

> **_This is a stable example. It should successfully build out of the box_**
>
> _This examples does is built on Construct Libraries marked "Stable" and does not have any infrastructure prerequisites to build._

---
<!--END STABILITY BANNER-->

## _General_

_This module may be used to create_ **_EC2 AutoScalling Group_** _resources in AWS cloud provider....._

---


## _Prerequisites_

_This module needs_ **_Terraform 0.12.19_** _or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).

_This module deploys aws services details are in respective feature branches._


---


## _Features_

_Below we are able to check the resources that are being created as part of this module call:_

* **_EC2 AutoScalling Group_**


---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

_Example with_ **_launch\_tamplate_**

```tf
module "autoscaling_group" {
  source = "git::https://github.com/nitinda/terraform-module-aws-autoscaling-group.git?ref=master"

  providers = {
    aws = aws.services
  }

  name_prefix               = "ec2-asg-"
  desired_capacity          = 1
  max_size                  = 1
  min_size                  = 0
  default_cooldown          = 1
  vpc_zone_identifier       = var.vpc_zone_identifier
  health_check_grace_period = 1
  launch_template           = {
      id      = var.launch_template_id
      version = "$Latest"
  }
  tags                      = merge(var.common_tags, map(
    "Name", "ec2-autoscaling-group"
  ))
}

```

_Example with_ **_mixed\_instances\_policy_**

```tf
module "autoscaling_group" {
  source = "git::https://github.com/nitinda/terraform-module-aws-autoscaling-group.git?ref=terraform-12/master"

  providers = {
    aws = aws.services
  }
  
  name_prefix               = "ec2-asg-"
  desired_capacity          = 0
  max_size                  = 0
  min_size                  = 0
  default_cooldown          = 1
  vpc_zone_identifier       = var.vpc_zone_identifier
  health_check_grace_period = 1
  launch_template           = {}
  mixed_instances_policy    = {
      launch_template = {
          launch_template_specification = {
              launch_template_id = var.launch_template_id
              version            = "$Latest"
          }

          override = [
              {
                  instance_type = "m4.large"
              },
              {
                  instance_type = "t3.large"
              }
          ]
      }
      instances_distribution = {
          spot_allocation_strategy                 = "capacity-optimized"
          on_demand_base_capacity                  = 0
          on_demand_percentage_above_base_capacity = 0
      }
  }
  tags                      = merge(var.common_tags, map(
    "Name", "ec2-autoscaling-group"
  ))
}

```
---

## _Inputs_

_The variables required in order for the module to be successfully called from the deployment repository are the following:_


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|-----:|
| **_name_** | _The name of the auto scaling group_ | _string_ | **_Optional <br/> (Default - null)_** |
| **_name\_prefix_** | _Creates a unique name beginning with the specified prefix_ | _string_ | **_Optional <br/> (Default - null)_** |
| **_max\_size_** | _The maximum size of the auto scale group_ | _number_ | **_Optional <br/> (Default - 0)_** |
| **_min\_size_** | _The minimum size of the auto scale group_ | _number_ | **_Optional <br/> (Default - 0)_** |
| **_default\_cooldown_** | _The amount of time, in seconds, after a scaling activity <br/> completes before another scaling activity can start_ | _string_ | **_Optional <br/> (Default - 60)_** |
| **_desired\_capacity_** | _The number of Amazon EC2 instances_ | _string_ | **_Required_** |
| **_health\_check\_type_** | _Type of health check_ | string | **_Optional (Default - EC2)_** |
| **_force\_delete_** | _Allows deleting the autoscaling group_ | _string_ | **_Optional (Default - true)_** |
| **_vpc\_zone\_identifier_** | _A list of subnet IDs to launch resources_ | _list(string)_ | **_Required_** |
| **_target\_group\_arns_** | _A list of aws_alb_target_group ARNs_ | _list(string)_ | **_Optional_** |
| **_health\_check\_grace\_period_** | _Time (in seconds) after instance comes_ | _string_ | **_Optional (Default - 300)_** |
| **_suspended\_processes_** | _A list of processes to suspend_ | _list(string)_ | **_Optional_** |
| **_tags_** | _A list of tag blocks_ | _map(string)_ | **_Required_** |
| **_mixed\_instances\_policy_** | _Configuration block_ | _any_ | **_Optional_** |
| **_launch\_template_** | _Nested argument with Launch template_ | _map(string)_ | **_Required_** |


---


## _Outputs_

* **_id_**
* **_name_**
* **_arn_**

---


### _Usage_

_In order for the variables to be accessed on module level please use the syntax below:_

```tf
module.<module_name>.<output_variable_name>
```

_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
data.terraform_remote_state.<module_name>.<output_variable_name>
```
---


## Authors
_Module maintained by Module maintained by the -_ **_Nitin Das_**